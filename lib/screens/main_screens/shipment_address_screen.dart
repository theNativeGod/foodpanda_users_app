import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodpanda_users_app/global/global.dart';
import 'package:foodpanda_users_app/screens/main_screens/order_screen.dart';
import 'package:provider/provider.dart';

import '../../models/orders.dart';
import '../../models/cart.dart';

class ShipmentAddressScreen extends StatefulWidget {
  ShipmentAddressScreen({super.key});

  @override
  State<ShipmentAddressScreen> createState() => _ShipmentAddressScreenState();
}

class _ShipmentAddressScreenState extends State<ShipmentAddressScreen> {
  var isLoading = false;
  String? userAddress;
  @override
  void initState() {
    getAddress();
    super.initState();
  }

  getAddress() async {
    setState(() {
      isLoading = true;
    });
    final firestoreDocRef = FirebaseFirestore.instance
        .collection('users')
        .doc(sharedPreferences!.getString('uid'));
    DocumentSnapshot documentSnapshot = await firestoreDocRef.get();
    setState(() {
      isLoading = false;
    });
    Map<String, dynamic> userData =
        documentSnapshot.data() as Map<String, dynamic>;
    print(userData);
    userAddress = userData['address'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shipment Address'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.red,
                Colors.amber,
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.amber.shade200,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: isLoading
                ? CircularProgressIndicator()
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Your Current Shipping Address:\n\n" +
                        userAddress!.toString())),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          List<CartItem> cartItems =
              Provider.of<Cart>(context, listen: false).items.values.toList();

          Provider.of<Orders>(context, listen: false)
              .addOrder(cartItems, userAddress.toString());
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderScreen(),
            ),
          );
        },
        label: Text('Proceed'),
        icon: Icon(Icons.navigate_next_outlined),
      ),
    );
  }
}
