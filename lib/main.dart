import 'package:flutter/material.dart';
import 'expenseclass.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';

MyData myExpenses = MyData();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyDashboard(),
    );
  }
}

class MyDashboard extends StatefulWidget {
  @override
  State<MyDashboard> createState() => MyDashboardState();
}

class MyDashboardState extends State<MyDashboard> {
  Map<String, String> myIconMap = {
    'education': 'assets/education.png',
    'entertainment': 'assets/entertainment.png',
    'food': 'assets/food.png',
    'housing': 'assets/housing.png',
    'transportation': 'assets/transportation.png',
    'utility': 'assets/utility.png',
  };

  Map<String, double> get myPieCat {
    Map<String, double> tempMap = {};
    for (int i = 0; i < myExpenses.expenses.length; i++) {
      if (!(tempMap.containsKey(myExpenses.expenses[i].category)) &&
          (myIconMap.keys
              .toList()
              .contains(myExpenses.expenses[i].category.toLowerCase()))) {
        tempMap[myExpenses.expenses[i].category] = myExpenses.expenses[i].price;
      } else if (tempMap.containsKey(myExpenses.expenses[i].category)) {
        tempMap[myExpenses.expenses[i].category] =
            myExpenses.expenses[i].price +
                tempMap[myExpenses.expenses[i].category]!;
      }
    }
    return tempMap;
  }

  String retrieveIcon(String myCat) {
    String theString = '';
    myIconMap.forEach((key, value) {
      if (myCat.toLowerCase() == key.toLowerCase()) {
        theString = value;
      }
    });
    return theString;
  }

  CircleAvatar myCircularAvatar(String myAsset) {
    return CircleAvatar(
        backgroundColor: Colors.transparent,
        child: SizedBox(
            width: 60,
            height: 60,
            child: ClipOval(
              child: Image.asset(myAsset),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 5'),
      ),
      body: Column(
        children: [
          PieChart(
            dataMap: myPieCat,
            chartValuesOptions: const ChartValuesOptions(
              showChartValuesInPercentage: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
          child: SizedBox(
            height: 460,
            child: Flexible(
              child: ListView.builder(
                itemCount: myExpenses.expenses.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: (retrieveIcon(
                                myExpenses.expenses[index].category) !=
                            '')
                        ? myCircularAvatar(
                            retrieveIcon(myExpenses.expenses[index].category))
                        : const Icon(Icons.circle_rounded),
                    title: Text(
                        '${myExpenses.expenses[index].title} \$${myExpenses.expenses[index].price} on ${DateFormat.yMd().format(myExpenses.expenses[index].date)}'),
                  );
                },
              ),
            ),
          ),
          ),
          Center(
            child: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
