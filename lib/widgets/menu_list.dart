import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/menu_design.dart' as m;

import '../models/menus.dart';
import '../models/sellers.dart';

class MenuList extends StatelessWidget {
  Sellers model;
  MenuList(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .8,
      width: double.infinity,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("sellers")
            .doc(model.sellerUID)
            .collection("menus")
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
                    Menus mModel = Menus.fromJson(
                        snapshot.data!.docs[i].data() as Map<String, dynamic>);
                    return m.MenuDesignWidget(
                      model: mModel,
                      context: ctx,
                      id: model.sellerUID,
                    );
                  },
                );
        },
      ),
    );
  }
}
