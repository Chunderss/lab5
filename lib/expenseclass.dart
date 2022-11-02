class Expense {
  String category;
  String title;
  double price;
  DateTime date;
  Expense(this.category, this.title, this.price, this.date);
}

class MyData {
  List<Expense> expenses = [
    Expense('Utility', 'XCEL Bill', 109.55, DateTime.utc(2022, 10, 1)),
    Expense('Food', 'Grocery', 112.34, DateTime.utc(2022, 10, 1)),
    Expense('Transportation', 'Gas', 35.51, DateTime.utc(2022, 10, 11)),
    Expense('Food', 'Lunch', 15.51, DateTime.utc(2022, 10, 11)),
    Expense('Entertainment', 'Movie', 19.98, DateTime.utc(2022, 10, 15)),
    Expense('Education', 'Books', 250.75, DateTime.utc(2022, 9, 19)),
    Expense('Housing', 'Rent', 650, DateTime.utc(2022, 10, 25)),
    Expense('Food', 'Dinner with friends', 35.51, DateTime.utc(2022, 10, 26)),
    Expense('Food', 'Lunch', 12.34, DateTime.utc(2022, 10, 29)),
    Expense('Transportation', 'Gas', 39.51, DateTime.utc(2022, 10, 11)),
    Expense('Shopping', 'Buy Jacket', 150.99, DateTime.utc(2022, 10, 29)),
    Expense('Entertainment', 'Movie & Popcorn', 29.98, DateTime.utc(2022, 10, 29)),
  ];
}