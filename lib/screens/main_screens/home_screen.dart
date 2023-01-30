import 'package:flutter/material.dart';

import '../../global/global.dart';
import '../../widgets/my_drawer.dart';
import '../../widgets/carousal.dart';
import '../../widgets/sellers_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /*final items = [
    "assets/slider/0.jpg",
    "assets/slider/1.jpg",
    "assets/slider/2.jpg",
    "assets/slider/3.jpg",
    "assets/slider/4.jpg",
    "assets/slider/5.jpg",
    "assets/slider/6.jpg",
    "assets/slider/7.jpg",
    "assets/slider/8.jpg",
    "assets/slider/9.jpg",
    "assets/slider/10.jpg",
    "assets/slider/11.jpg",
    "assets/slider/12.jpg",
    "assets/slider/13.jpg",
    "assets/slider/14.jpg",
    "assets/slider/15.jpg",
    "assets/slider/16.jpg",
    "assets/slider/17.jpg",
    "assets/slider/18.jpg",
    "assets/slider/19.jpg",
    "assets/slider/20.jpg",
    "assets/slider/21.jpg",
    "assets/slider/22.jpg",
    "assets/slider/23.jpg",
    "assets/slider/24.jpg",
    "assets/slider/25.jpg",
    "assets/slider/26.jpg",
    "assets/slider/27.jpg",
  ];
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          sharedPreferences!.getString("name")!,
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
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Carousel(),
            SellersList(),
          ],
        ),
      ),
    );
  }
}
