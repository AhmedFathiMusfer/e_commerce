import 'dart:math';

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

  Future<Cart?> getCart(String productId, String size);
  Future<void> updateCart(Cart cart);
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
    var result = await getCart(cart.productId, cart.size);
    if (result == null) {
      await _service.setData(
          path: AppPath.addToCart(uid, cart.id), data: cart.toMap());
    } else {
      cart.id = result.id;
      cart.quantity += result.quantity;
      await _service.setData(
          path: AppPath.addToCart(uid, cart.id), data: cart.toMap());
    }
  }

  @override
  Stream<List<Cart>> myCartStream() {
    return _service.collectionStraeme(
        path: AppPath.mycart(uid),
        builder: (data, documentId) => Cart.fromMap(data!, documentId));
  }

  @override
  Future<Cart?> getCart(String productId, String size) async {
    var result = await _service
        .collectionStraeme(
            path: AppPath.mycart(uid),
            builder: (data, documentId) => Cart.fromMap(data!, documentId),
            queryBuilder: (query) => query
                .where('productId', isEqualTo: productId)
                .where("size", isEqualTo: size))
        .first;
    if (result.length > 0) {
      return result.first;
    }
    return null;
  }

  @override
  Future<void> updateCart(Cart cart) async {
    if (cart.quantity > 0) {
      await _service.setData(
          path: AppPath.addToCart(uid, cart.id), data: cart.toMap());
    } else {
      await _service.deleteData(path: AppPath.addToCart(uid, cart.id));
    }
  }
}
