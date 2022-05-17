// ignore_for_file: avoid_print

import 'models/product.dart';

List<Product> getProductByCategory(List<Product> allproducts) {
  List<Product> products = [];
  try {
    for (var product in allproducts) {
      products.add(product);
    }
  } on Error catch (ex) {
    print(ex);
  }
  return products;
}
