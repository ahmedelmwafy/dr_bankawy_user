// ignore_for_file: avoid_print

import 'models/product.dart';

List<Product> getProductByCategory(String kloan, List<Product> allproducts) {
  List<Product> products = [];
  try {
    for (var product in allproducts) {
      if (product.pCategory == kloan) {
        products.add(product);
      }
    }
  } on Error catch (ex) {
    print(ex);
  }
  return products;
}
