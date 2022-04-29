import 'package:dr_bankawy/constants.dart';
import 'package:dr_bankawy/models/order.dart';
import 'package:dr_bankawy/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Store {
  final Firestore _firestore = Firestore.instance;

  addProduct(Product product) {
    _firestore.collection(kProductsCollection).add({
      kProductName: product.pName,
      kProductDescription: product.pDescription,
      kProductImage: product.pImage,
      kProductCategory: product.pCategory,
      kProductPrice: product.pPrice
    });
  } 
  
    addOrder(Order product) {
    _firestore.collection(kOrders).add({
      kUserEmail: product.oUserEmail,
      kisAccepted: product.oIsAccepted,
      kisReviewed: product.oIsReviewed,
      kCreatedDate: product.oCreatedDate
    });
  } 

  Stream<QuerySnapshot> loadProducts() {
    return _firestore.collection(kProductsCollection).snapshots();
  }

  Stream<QuerySnapshot> loadOrders() {
    return _firestore.collection(kOrders).snapshots();
  }

  Stream<QuerySnapshot> loadOrderDetails(documentId) {
    return _firestore
        .collection(kOrders)
        .document(documentId)
        .collection(kOrderDetails)
        .snapshots();
  }

  deleteProduct(documentId) {
    _firestore.collection(kProductsCollection).document(documentId).delete();
  }

  editProduct(data, documentId) {
    _firestore
        .collection(kProductsCollection)
        .document(documentId)
        .updateData(data);
  }

  storeOrders(data, List<Product> products) {
    var documentRef = _firestore.collection(kOrders).document();
    documentRef.setData(data);
    for (var product in products) {
      documentRef.collection(kOrderDetails).document().setData({
        kProductName: product.pName,
        kProductPrice: product.pPrice,
        kProductQuantity: product.pQuantity,
        kProductName: product.pImage,
        kProductCategory: product.pCategory
      });
    }
  }
}
