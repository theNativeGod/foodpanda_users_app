import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda_users_app/global/global.dart';
import 'package:foodpanda_users_app/models/cart.dart';
import 'package:provider/provider.dart';
import '../../models/items.dart';

class ItemDetailScreen extends StatefulWidget {
  Items model;
  ItemDetailScreen(this.model, {super.key});

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      appBar: AppBar(
        title: Text(
          widget.model.title!.toString(),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 400,
                  width: 500,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(300),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(widget.model.thumbnailUrl!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -15,
                  left: 20,
                  child: Container(
                    height: 50,
                    width: 130,
                    decoration: BoxDecoration(
                      color: Colors.amber.shade100,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 1.5,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Colors.amber.shade900,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '\$${widget.model.price}',
                        style: const TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -20,
                  right: 10,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                    child: Icon(
                      Icons.shopping_cart,
                      size: 70,
                      color: Colors.red.shade900,
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Item Added To Cart..'),
                        ),
                      );
                      Provider.of<Cart>(context, listen: false)
                          .addToCart(widget.model);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text("Description",
                style: TextStyle(
                  fontSize: 30,
                )),
            Container(
              margin: const EdgeInsets.only(top: 10.0, bottom: 20.0),
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              //height: 70,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 1,
                  ),
                ],
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Colors.amber.shade900,
                ),
                color: Colors.amber.shade100,
              ),
              child: Center(
                child: Text(
                  widget.model.longDescription!,
                  textAlign: TextAlign.left,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
