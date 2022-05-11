// ignore_for_file: avoid_print

import 'models/product.dart';

<<<<<<< HEAD
List<Product> getProductByCategory(List<Product> allproducts) {
  List<Product> products = [];
  try {
    for (var product in allproducts) {
      products.add(product);
=======
List<Product> getProductByCategory(String kloan, List<Product> allproducts) {
  List<Product> products = [];
  try {
    for (var product in allproducts) {
      if (product.pCategory == kloan) {
        products.add(product);
      }
>>>>>>> f706beba53f9b58f8b81ece9f2e0440dc6240389
    }
  } on Error catch (ex) {
    print(ex);
  }
  return products;
}
