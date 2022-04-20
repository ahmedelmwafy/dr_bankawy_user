// ignore_for_file: must_call_super, unused_field, file_names

import 'package:dr_bankawy/constants.dart';
import 'package:dr_bankawy/models/product.dart';
import 'package:dr_bankawy/screens/login_screen.dart';
import 'package:dr_bankawy/screens/user/CartScreen.dart';
import 'package:dr_bankawy/screens/user/productInfo.dart';
import 'package:dr_bankawy/services/store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dr_bankawy/services/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../functions.dart';

class HomePage extends StatefulWidget {
  static String id = 'HomePage';

  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = Auth();
  FirebaseUser _loggedUser;
  final _store = Store();
  List<Product> _products;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () {
            Navigator.pushNamed(context, CartScreen.id);
          },
          child: const Icon(
            Icons.notifications_rounded,
            color: Colors.white,
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('About'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Contact'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Logout'),
                onTap: () async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.clear();
                  await _auth.signOut();
                  Navigator.popAndPushNamed(context, LoginScreen.id);
                },
              ),
            ],
          ),
        ),
        body: jacketView());
  }

  @override
  void initState() {
    getCurrenUser();
  }

  getCurrenUser() async {
    _loggedUser = await _auth.getUser();
  }

  Widget jacketView() {
    return StreamBuilder<QuerySnapshot>(
      stream: _store.loadProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Product> products = [];
          for (var doc in snapshot.data.documents) {
            var data = doc.data;
            products.add(Product(
                pId: doc.documentID,
                pPrice: data[kProductPrice],
                pName: data[kProductName],
                pDescription: data[kProductDescription],
                pLocation: data[kProductLocation],
                pCategory: data[kProductCategory]));
          }

          _products = [...products];
          products.clear();
          products = getProductByCategory(kJackets, _products);
          return Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: kThiredColor),
                  color: kMainColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: const Icon(
                          Icons.menu,
                          color: kThiredColor,
                        )),
                    const Text("الرئيسية"),
                    const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("images/icons/buyicon.png"),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ProductInfo.id,
                            arguments: products[index]);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(products[index].pName),
                                Text(products[index].pDescription),
                                Text(products[index].pPrice),
                              ],
                            ),
                            const Spacer(),
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  products[index].pLocation,
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  itemCount: products.length,
                ),
              ),
            ],
          );
        } else {
          return const Center(child: Text('Loading...'));
        }
      },
    );
  }
}
/*
    
*/
  /*
                  Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(products[index].pLocation),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Opacity(
                        opacity: .6,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  products[index].pName,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('\$ ${products[index].pPrice}')
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                */