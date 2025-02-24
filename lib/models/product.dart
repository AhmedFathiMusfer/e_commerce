import 'package:e_commerce/utilities/assets.dart';

class Product {
  String id;
  final String title;
  final int price;
  final String imagUrl;
  final int? discountValue;
  final String category;
  final double? rate;
  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.imagUrl,
      this.discountValue,
      this.category = "boy",
      this.rate});
  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'price': this.price,
      'imagUrl': this.imagUrl,
      'discountValue': this.discountValue,
      'category': this.category,
      'rate': this.rate,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map, String documentId) {
    return Product(
      id: documentId,
      title: map['title'],
      price: map['price'],
      imagUrl: map['imagUrl'],
      discountValue: map['discountValue'],
      category: map['category'],
      rate: map['rate'],
    );
  }
}

List<Product> dummyProducts = [
  Product(
      id: "1",
      title: "T-shirt",
      price: 300,
      imagUrl: AppAssets.topPannerHomePage,
      category: "clothes",
      discountValue: 2),
  Product(
      id: "2",
      title: "T-shirt",
      price: 300,
      imagUrl: AppAssets.topPannerHomePage,
      category: "clothes",
      discountValue: 20),
  Product(
      id: "3",
      title: "T-shirt",
      price: 300,
      imagUrl: AppAssets.topPannerHomePage,
      category: "clothes",
      discountValue: 20),
  Product(
      id: "4",
      title: "T-shirt",
      price: 300,
      imagUrl: AppAssets.topPannerHomePage,
      category: "clothes",
      discountValue: 20),
  Product(
      id: "5",
      title: "T-shirt",
      price: 300,
      imagUrl: AppAssets.topPannerHomePage,
      category: "clothes",
      discountValue: 20)
];
