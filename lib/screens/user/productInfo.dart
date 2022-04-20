// ignore_for_file: deprecated_member_use, avoid_print, file_names

import 'package:dr_bankawy/constants.dart';
import 'package:dr_bankawy/models/product.dart';
import 'package:dr_bankawy/provider/cartItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductInfo extends StatefulWidget {
  static String id = 'ProductInfo';

  const ProductInfo({Key key}) : super(key: key);
  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  int _quantity = 1;
  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: kMainColor,
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(
            height: 50,
          ),
          Container(
            height: MediaQuery.of(context).size.height * .2,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      product.pName,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w200),
                    ),
                    Text("نوع القرض \n" + product.pPrice),
                  ],
                ),
                const Spacer(),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      product.pLocation,
                      height: MediaQuery.of(context).size.height * 0.2,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "معلومات عن القرض",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
                ),
                Text("نوع القرض \n" + product.pPrice),
                Text(
                  product.pName,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Text(
                  "الفائدة \n" + "١٢٩",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "الضمان \n" + "١٢٩",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Text(
                  "مدة القرض \n" + "١٢٩",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Text(
                  "الخط الساحن \n" + "١٢٩",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Text(
                  "اقرب فرع \n" + "١٢٩",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  product.pDescription,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  product.pPrice,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Builder(
                    builder: (context) => RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: kSecondaryColor,
                      onPressed: () {
                        addToCart(context, product);
                      },
                      child: const Text(
                        'قم بالتقديم علي القرض',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: kThiredColor),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  subtract() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
        print(_quantity);
      });
    }
  }

  add() {
    setState(() {
      _quantity++;
      print(_quantity);
    });
  }

  void addToCart(context, product) {
    CartItem cartItem = Provider.of<CartItem>(context, listen: false);
    product.pQuantity = _quantity;
    bool exist = false;
    var productsInCart = cartItem.products;
    for (var productInCart in productsInCart) {
      if (productInCart.pName == product.pName) {
        exist = true;
      }
    }
    if (exist) {
      Scaffold.of(context).showSnackBar(const SnackBar(
        content: Text('لقدم تم التقديم مسبقا'),
      ));
    } else {
      cartItem.addProduct(product);
      Scaffold.of(context).showSnackBar(const SnackBar(
        content: Text('تم التقديم علي القرض بنجاح'),
      ));
    }
  }
}
