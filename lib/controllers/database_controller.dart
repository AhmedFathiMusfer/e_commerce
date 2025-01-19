import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/services/firestore_services.dart';

abstract class Database {
  Stream<List<Product>> ProductStream();
}

class FireStoreDatabase implements Database {
  final _service = FirestoreServices.instance;

  @override
  Stream<List<Product>> ProductStream() {
    return _service.collectionStraeme(
        path: "/Product",
        builder: (data, documentId) => Product.fromMap(data!, documentId));
  }
}
