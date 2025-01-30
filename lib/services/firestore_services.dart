import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class FirestoreServices {
  FirestoreServices._();
  static final instance = FirestoreServices._();
  final _firestore = FirebaseFirestore.instance;
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<void> setData(
      {required String path, required Map<String, dynamic> data}) async {
    final reference = _firestore.doc(path);
    reference.set(data);
  }

  Future<void> deleteData({required String path}) async {
    final reference = _firestore.doc(path);
    reference.delete();
  }

  Stream<T> documentsStraem<T>(
      {required String path,
      required T Function(Map<String, dynamic>? data, String documentId)
          builder}) {
    final reference = _firestore.doc(path);
    return reference
        .snapshots()
        .map((snapshot) => builder(snapshot.data(), snapshot.id));
  }

  Stream<List<T>> collectionStraeme<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentId) builder,
    Query Function(Query query)? queryBuilder,
  }) {
    Query query = _firestore.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final Snapshot = query.snapshots();
    debugPrint(query.snapshots().length.toString());
    return Snapshot.map((snapshot) => snapshot.docs
        .map((snapshot) =>
            builder(snapshot.data() as Map<String, dynamic>, snapshot.id))
        .where((value) => value != null)
        .toList());
  }

  void _setupFirebaseListeners() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }

      // تحديث عدد الإشعارات
      updateBadgeCount();
    });
  }

  Future<void> updateBadgeCount() async {
    // int currentCount = await FlutterAppBadger.getBadgeCount() ?? 0;
    // int newCount = currentCount + 1;
    // FlutterAppBadger.updateBadgeCount(newCount);
  }
}
