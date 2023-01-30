import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/menus.dart';

import '../widgets/items_design.dart';
import '../models/items.dart';

class ItemsList extends StatelessWidget {
  Menus model;
  String id;
  ItemsList(this.model, this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .8,
      width: double.infinity,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("sellers")
            .doc(id.toString())
            .collection("menus")
            .doc(model.menuID)
            .collection('items')
            .snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.amber,
                  ),
                )
              : ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (ctx, i) {
                    Items itModel = Items.fromJson(
                        snapshot.data!.docs[i].data() as Map<String, dynamic>);

                    return ItemDesignWidget(
                      model: itModel,
                      context: ctx,
                    );
                  },
                );
        },
      ),
    );
  }
}
