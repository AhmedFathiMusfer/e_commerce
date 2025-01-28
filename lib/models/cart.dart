class Cart {
  String id;
  final String productId;
  final String title;
  int quantity;
  final int price;
  final String imageUrl;
  final int discountValue;
  final String size;
  final String color;

  Cart({
    required this.productId,
    required this.imageUrl,
    this.discountValue = 0,
    required this.size,
    this.color = "black",
    required this.id,
    required this.title,
    this.quantity = 1,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'productId': this.productId,
      'imageUrl': this.imageUrl,
      'discountValue': this.discountValue,
      'size': this.size,
      'color': this.color,
      'id': this.id,
      'title': this.title,
      'quantity': this.quantity,
      'price': this.price,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map, String documentId) {
    return Cart(
      productId: map['productId'],
      imageUrl: map['imageUrl'],
      discountValue: map['discountValue'],
      size: map['size'],
      color: map['color'],
      id: documentId,
      title: map['title'],
      quantity: map['quantity'],
      price: map['price'],
    );
  }
}
