import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart' as c;

class CartItemCard extends StatelessWidget {
  c.CartItem item;
  CartItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<c.Cart>(context);
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(item.imageUrl),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Text(
                      item.title,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      '\$${item.price} x ${item.quantity}',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.delete_forever,
                color: Colors.red.shade900,
              ),
              onPressed: () {
                cartData.removeItem(item.id, context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
