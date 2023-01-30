import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/sellers.dart';

import '../widgets/info_design.dart';

class SellersList extends StatelessWidget {
  const SellersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: double.infinity,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("sellers").snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    Sellers sModel = Sellers.fromJson(snapshot.data!.docs[index]
                        .data()! as Map<String, dynamic>);

                    return InfoDesignWidget(
                      model: sModel,
                      context: context,
                    );
                  },
                );
        },
      ),
    );
  }
}
