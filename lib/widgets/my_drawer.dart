import 'package:flutter/material.dart';
import 'package:foodpanda_users_app/screens/main_screens/cart_screen.dart';
import 'package:foodpanda_users_app/screens/main_screens/home_screen.dart';
import 'package:foodpanda_users_app/screens/main_screens/order_screen.dart';

import '../global/global.dart';
import '../screens/authentication/auth_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
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
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 25, bottom: 10),
            child: Column(
              children: [
                //header drawer
                Material(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(80),
                  ),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      height: 160,
                      width: 170,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            sharedPreferences!.getString("photoUrl")!),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  sharedPreferences!.getString("name")!,
                  style: const TextStyle(
                      color: Colors.white, fontSize: 20, fontFamily: "Train"),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          //body drawer
          Container(
            padding: const EdgeInsets.only(top: 1.0),
            child: Column(
              children: [
                const Divider(
                  height: 10,
                  color: Colors.red,
                  thickness: 2,
                ),
                ListTile(
                  leading: const Icon(Icons.home, color: Colors.white),
                  title: const Text(
                    "Home",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => HomeScreen(),
                      ),
                    );
                  },
                ),
                const Divider(
                  height: 10,
                  color: Colors.red,
                  thickness: 2,
                ),
                ListTile(
                  leading: const Icon(Icons.shopping_cart, color: Colors.white),
                  title: const Text(
                    "Cart",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => CartScreen(),
                      ),
                    );
                  },
                ),
                const Divider(
                  height: 10,
                  color: Colors.red,
                  thickness: 2,
                ),
                ListTile(
                  leading: const Icon(Icons.reorder, color: Colors.white),
                  title: const Text(
                    "My Orders",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => const OrderScreen()));
                  },
                ),
                const Divider(
                  height: 10,
                  color: Colors.red,
                  thickness: 2,
                ),
                ListTile(
                  leading: const Icon(Icons.access_time, color: Colors.white),
                  title: const Text(
                    "History",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  height: 10,
                  color: Colors.red,
                  thickness: 2,
                ),
                ListTile(
                  leading: const Icon(Icons.search, color: Colors.white),
                  title: const Text(
                    "Search",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  height: 10,
                  color: Colors.red,
                  thickness: 2,
                ),
                ListTile(
                  leading: const Icon(Icons.add_location, color: Colors.white),
                  title: const Text(
                    "Add New Address",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  height: 10,
                  color: Colors.red,
                  thickness: 2,
                ),
                ListTile(
                  leading: const Icon(Icons.exit_to_app, color: Colors.white),
                  title: const Text(
                    "Sign Out",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    firebaseAuth.signOut();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (c) => const AuthScreen(),
                      ),
                    );
                  },
                ),
                const Divider(
                  height: 10,
                  color: Colors.red,
                  thickness: 2,
                ),
                //const SizedBox(height: 12),
              ],
            ),
          ),
          Container(
            height: 145,
            //decoration: const BoxDecoration(
            //  gradient: LinearGradient(
            //    colors: [
            //      Colors.red,
            //      Colors.amber,
            //    ],
            //    begin: FractionalOffset(0.0, 0.0),
            //    end: FractionalOffset(1.0, 0.0),
            //    stops: [0.0, 1.0],
            //    tileMode: TileMode.clamp,
            //  ),
            //),
            child: const Center(
              child: Text(
                "iFood",
                style: TextStyle(
                  fontSize: 60,
                  fontFamily: "Lobster-Regular",
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
