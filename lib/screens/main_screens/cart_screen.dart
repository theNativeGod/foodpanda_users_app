import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda_users_app/global/global.dart';
import 'package:foodpanda_users_app/screens/main_screens/order_screen.dart';
import 'package:foodpanda_users_app/screens/main_screens/shipment_address_screen.dart';
import 'package:provider/provider.dart';

import '../../models/orders.dart';
import '../../widgets/my_drawer.dart';
import '../../widgets/cart_item_card.dart';
import '../../models/cart.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var loading = false;
  var isInit = true;
  @override
  void didChangeDependencies() {
    if (isInit) {
      fetchData();
    }
    isInit = false;
    super.didChangeDependencies();
  }

  void fetchData() async {
    setState(() {
      loading = true;
    });

    await Provider.of<Cart>(context).fetchAndSetData();

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.amber.shade200,
      appBar: AppBar(
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
        title: Text('Your Cart'),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          Text('Total Amount: \$${cartData.totalAmount.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
          Container(
            height: MediaQuery.of(context).size.height * .8,
            child: ListView.builder(
              itemCount: cartData.items.length,
              itemBuilder: (ctx, i) {
                return CartItemCard(cartData.items.values.toList()[i]);
              },
            ),
          ),
        ],
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        const SizedBox(
          width: 10,
        ),
        FloatingActionButton.extended(
          heroTag: 'btn 1',
          onPressed: () {
            cartData.items.isEmpty ? null : cartData.clearAll(context);
          },
          label: const Text('Clear All'),
          icon: const Icon(
            Icons.clear_all,
          ),
        ),
        FloatingActionButton.extended(
          heroTag: 'btn 2',
          onPressed: () {
            cartData.items.isNotEmpty
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => ShipmentAddressScreen(),
                    ),
                  )
                : null;
          },
          label: const Text('Check Out'),
          icon: const Icon(Icons.navigate_next),
        ),
      ]),
    );
  }
}
