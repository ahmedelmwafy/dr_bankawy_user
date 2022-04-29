// ignore_for_file: deprecated_member_use, avoid_print, file_names

import 'package:dr_bankawy/constants.dart';
import 'package:dr_bankawy/models/order.dart';
import 'package:dr_bankawy/models/product.dart';
import 'package:dr_bankawy/services/store.dart';
import 'package:dr_bankawy/widgets/map.dart';
import 'package:flutter/material.dart';

class ProductInfo extends StatefulWidget {
  static String id = 'ProductInfo';

  const ProductInfo({Key key}) : super(key: key);
  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  Store store = Store();

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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        product.pName,
                      ),
                      Text(product.pDescription),
                      const Text("قرض شخصي"),
                    ],
                  ),
                ),
                const Spacer(),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      product.pImage,
                      height: MediaQuery.of(context).size.height * 0.2,
                      fit: BoxFit.contain,
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
                ),
                Text(
                  "الفائدة ${product.pDescription}",
                ),
                Text("الفائدة :" + product.pPrice + " %" ?? ""),
                const Text(
                  "الضمان : تحويل موتبة",
                ),
                Text(
                  "الاوراق المطلوبه" "\n" + product.pPapers ?? "",
                  style: const TextStyle(
                      // fontSize: 16,
                      ),
                ),
                // Text(
                //   "الضمان \n" + product.pProductDuration ?? "",
                // ),
                Text(
                  "الخط الساحن \n" + product.pPhone.toString() ?? "",
                ),

                // Text(
                //   product.pDescription,
                //   style: const TextStyle(
                //     fontSize: 16,
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // Text(
                //   product.pPrice,
                //   style: const TextStyle(
                //     fontSize: 20,
                //   ),
                // ),
                SizedBox(
                  height: 200,
                  child: MapSample(
                    latLng: product.pLatitude,
                    long: product.plongitude,
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
                        store.addOrder(Order(
                          oUserEmail: "userEmail",
                          oIsAccepted: false,
                          oIsReviewed: false,
                          oCreatedDate:
                              DateTime.now().toUtc().millisecondsSinceEpoch,
                        ));
                        Scaffold.of(context).showSnackBar(const SnackBar(
                          content: Text('لقدم تم التقديم مسبقا'),
                        ));
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
}
