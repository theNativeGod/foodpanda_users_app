import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../widgets/menu_list.dart';
import '../../global/global.dart';
import '../../models/sellers.dart';
import '../../widgets/my_drawer.dart';
import '../../widgets/text_header_widget.dart';

class MenuScreen extends StatefulWidget {
  Sellers model;
  MenuScreen(this.model, {super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.model.sellerName.toString(),
          style: const TextStyle(
            fontFamily: 'Lobster-Regular',
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
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
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (c) => const MenusUploadScreen(),
              //   ),
              // );
            },
            icon: const Icon(Icons.post_add, color: Colors.white),
          ),
        ],
      ),
      // drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextWidgetHeader('My Menus'),
            MenuList(widget.model),
          ],
        ),
      ),
    );
  }
}
