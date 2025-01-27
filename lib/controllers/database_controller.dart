import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/cart.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/models/user_data.dart';
import 'package:e_commerce/services/firestore_services.dart';
import 'package:e_commerce/utilities/api_paths.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class Database {
  Stream<List<Product>> SelesProductStream();
  Stream<List<Product>> NewProductStream();

  Future<void> setUserData(UserData userData);

  Future<void> addToCart(Cart cart);

  Stream<List<Cart>> myCartStream();
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
        queryBuilder: (query) => query.where('discountValue', isNotEqualTo: 0));
  }

  @override
  Stream<List<Product>> NewProductStream() {
    return _service.collectionStraeme(
        path: "Product/",
        builder: (data, documentId) => Product.fromMap(data!, documentId));
  }

  @override
  Future<void> setUserData(UserData userData) async {
    await _service.setData(
        path: AppPath.user(userData.uid), data: userData.toMap());
  }

  @override
  Future<void> addToCart(Cart cart) async {
    await _service.setData(
        path: AppPath.addToCart(uid, cart.id), data: cart.toMap());
  }

  @override
  Stream<List<Cart>> myCartStream() {
    return _service.collectionStraeme(
        path: AppPath.mycart(uid),
        builder: (data, documentId) => Cart.fromMap(data!, documentId));
  }
}
