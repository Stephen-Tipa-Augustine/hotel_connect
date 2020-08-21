class OrderModel {
  final String qty;
  final String name;
  final String price;
  final String paid;
  final String author_uid;
  OrderModel.breakFast(
      {this.qty, this.name, this.price, this.paid, this.author_uid});
}
