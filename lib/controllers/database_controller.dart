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
        queryBuilder: (query) => query.where('discountValue', isNotEqualTo: 0));
  }

  @override
  Stream<List<Product>> NewProductStream() {
    return _service.collectionStraeme(
        path: "Product/",
        builder: (data, documentId) => Product.fromMap(data!, documentId));
  }
}
//privilege exce leve 15 show run
// username ahmed privilege 15 secret 123456 
//enable secret leve 2 12356 
// view
//aaa new-model
//enaple view 
//parser view ahmed2
//secret 123456
//commands exce include conft
//superview
//aaa new-model
//enaple view 
//parser view ahmed superview
//view ahmed2 --this command is to add this view ahmed2 to superview ahmed
//show parser view all this to root view to show all views in the 
//privilege 
//role_base cli
//model 4
//ssh -1 ahmed 192.186.1.1 uoytube

//login
//login block-for 120 attempts 3 within 60
//login time-out 30
//transport input ssh
//login quit-mode access-class

//ios image 
//secure  boot-image
//reload
//dir flash0:
//boot flash0:nameoffile
//secure boot-confic restored as flash0:rescure-conf
//copy run sta

//aaa authentication local defualt 

//password recovery
//no service password-recovery