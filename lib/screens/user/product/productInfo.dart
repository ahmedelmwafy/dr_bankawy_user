// ignore_for_file: deprecated_member_use, avoid_print, file_names

import 'package:dr_bankawy/constants.dart';
import 'package:dr_bankawy/models/order.dart';
import 'package:dr_bankawy/models/product.dart';
import 'package:dr_bankawy/provider/userLoginData.dart';
import 'package:dr_bankawy/services/store.dart';
import 'package:dr_bankawy/widgets/map.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductInfo extends StatefulWidget {
  static String id = 'ProductInfo';

  const ProductInfo({Key key}) : super(key: key);
  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  Store store = Store();
  int orderCount = 0;
  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context).settings.arguments;
    String userEmail = Provider.of<UserData>(context).userEmail;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: kMainColor,
          child: const Icon(Icons.call),
          onPressed: () {
            launch(('tel://${product.pPhone}'));
          }),
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
                      Text(product.pDescription.length > 11
                          ? product.pDescription.substring(0, 10) + '...'
                          : product.pDescription),
                      const Text("?????? ????????"),
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
                  "?????????????? ???? ??????????\n",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
                ),
                Text(
                  "?????????????? ${product.pDescription}\n",
                ),
                Text("?????????????? :" + product.pPrice + " % \n" ?? ""),
                const Text(
                  "???????????? : ?????????? ??????????\n",
                ),
                Text(
                  "?????????????? ????????????????" "\n" "\n" + product.pPapers ?? "",
                ),
                Text(
                  "\n???????? ???????????? \n" + product.pPhone.toString() ?? "",
                ),
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
                        showDialog<void>(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                                content: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              height: 250,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset("images/icons/alert.png"),
                                  const Text(
                                    "???? ?????? ?????????? ???? ?????????????? ?????? ????????????",
                                    textAlign: TextAlign.center,
                                  ),
                                  const Text("?????????????? ???????? : ??????"),
                                  const Text("?????????? ???????? ????"),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          store.addOrder(Order(
                                            documentId: product.pId,
                                            oUserEmail: userEmail.toLowerCase(),
                                            oIsAccepted: false,
                                            oIsReviewed: false,
                                            oCreatedDate: DateTime.now()
                                                .toUtc()
                                                .millisecondsSinceEpoch,
                                          ));
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                            width: 80,
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Colors.blueAccent,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: const Center(
                                              child: Text(
                                                "??????",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            )),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                            width: 80,
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Colors.blueAccent,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: const Center(
                                              child: Text(
                                                "????",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            )),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ));
                          },
                        );
                      },
                      child: const Text(
                        '???? ???????????????? ?????? ??????????',
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
/*


                      
import 'package:flutter/material.dart';

void main() {
  runApp(const AlertyApp());
}

class AlertyApp extends StatelessWidget {
  const AlertyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
              showDialog<void>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                      content: Container(
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.network(
                            "https://www.pngmart.com/files/8/Exclamation-Mark-PNG-Photos.png"),
                        const Text("???? ?????? ?????????? ???? ?????????????? ?????? ????????????"),
                        const Text("?????????????? ???????? : ??????"),
                        const Text("?????????? ???????? ????"),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                  width: 100,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Center(
                                    child: Text(
                                      "????",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                  width: 100,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Center(
                                    child: Text(
                                      "??????",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),
                  ));
                },
              );
            },
            child: const Text("Show Diolog")),
      ),
    );
  }
}
*/