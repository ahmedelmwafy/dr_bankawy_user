// ignore_for_file: deprecated_member_use, avoid_print, file_names, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dr_bankawy/constants.dart';
import 'package:dr_bankawy/services/store.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../models/order.dart';
import '../../../provider/userLoginData.dart';

class NotificationsScreen extends StatefulWidget {
  static String id = 'NotificationsScreen';

  const NotificationsScreen({Key key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final Store _store = Store();
  var format = DateFormat("yyyy-MM-dd");
  String userEmail = "";

  @override
  Widget build(BuildContext context) {
    userEmail = Provider.of<UserData>(context).userEmail;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   title: const Text(
      //     'الاشعارات',
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   leading: GestureDetector(
      //     onTap: () {
      //       Navigator.pop(context);
      //     },
      //     child: const Icon(
      //       Icons.arrow_back,
      //       color: Colors.white,
      //     ),
      //   ),
      // ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _store.loadOrders(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text('there is no orders'),
            );
          } else {
            List<Order> orders = [];
            for (var doc in snapshot.data.documents) {
              //var productLoad = loadProducts(doc.data[kProductId]);
              if (doc.data[kUserEmail] == userEmail) {
                orders.add(Order(
                  documentId: doc.documentID,
                  oUserEmail: doc.data[kUserEmail],
                  oIsAccepted: doc.data[kisAccepted],
                  oIsReviewed: doc.data[kisReviewed],
                  oCreatedDate: doc.data[kCreatedDate],
                  productId: doc.data[kProductId],
                ));
              }
            }
            orders.sort((a, b) => a.oCreatedDate.compareTo(b.oCreatedDate));
            List<Order> finalOrderList = orders.reversed.toList();
            return Column(
              children: [
                Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
                    decoration: BoxDecoration(
                      color: kThiredColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      " حالة الطلب",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )),
                const Divider(
                  color: kThiredColor,
                  indent: 10,
                  endIndent: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) => Visibility(
                      // visible: orders[index].isReviewed && !orders[index].isAccepted
                      //     ? false
                      //     : true,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: finalOrderList[index].oIsReviewed
                              ? finalOrderList[index].oIsAccepted
                                  ? const Color.fromARGB(255, 24, 255, 71)
                                  : const Color.fromARGB(255, 255, 84, 71)
                              : kThiredColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'بريد المستخدم : ${finalOrderList[index].oUserEmail}',
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'كود الطلب : ${finalOrderList[index].documentId}',
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                  'حالة الطلب: ${finalOrderList[index].oIsAccepted && finalOrderList[index].oIsReviewed ? 'تم قبول' : !finalOrderList[index].oIsAccepted && finalOrderList[index].oIsReviewed ? 'تم رفض' : 'قيض المراجعة'}',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                  'تارخ الطلب: ${format.format(DateTime.fromMillisecondsSinceEpoch(finalOrderList[index].oCreatedDate))}',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    itemCount: orders.length,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
