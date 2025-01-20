import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/services/firestore_services.dart';

abstract class Database {
  Stream<List<Product>> SelesProductStream();
  Stream<List<Product>> NewProductStream();
}

class FireStoreDatabase implements Database {
  FireStoreDatabase(this.uid);
  final String uid;
  final _service = FirestoreServices.instance;

  @override
  Stream<List<Product>> SelesProductStream() {
    return _service.collectionStraeme(
        path: "Product/",
        builder: (data, documentId) => Product.fromMap(data!, documentId),
        queryBuilder: (query) =>
            query.where('discountValue1', isNotEqualTo: 0));
  }

  @override
  Stream<List<Product>> NewProductStream() {
    return _service.collectionStraeme(
        path: "Product/",
        builder: (data, documentId) => Product.fromMap(data!, documentId));
  }
}
