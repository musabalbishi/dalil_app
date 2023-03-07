import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalil_app/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/inner_details/stores_details.dart';
import '../widgets/stores_tile.dart';

class FireStoreServices {
  // Refrences
  static CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  static CollectionReference storesCollection =
      FirebaseFirestore.instance.collection('stores');
  static CollectionReference suggestionsCollection =
      FirebaseFirestore.instance.collection('suggestions');
  // all data from collection
  static all() {
    return StreamBuilder(
        stream: storesCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, i) {
                final storesData = snapshot.data;
                DocumentSnapshot documentSnapshot = snapshot.data!.docs[i];
                return StoreTile(
                  headerImage: Constants.img,
                  title: storesData!.docs[i]['name'],
                  subtitle: storesData.docs[i]['type'],
                  address: storesData.docs[i]['address'],
                  onTap: () {
                    Get.to(() => StoreDetails(
                          documentSnapshot: documentSnapshot,
                        ));
                  },
                );
              },
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('error'),
            );
          }
          if (!snapshot.hasData) {
            return const Text('no data yet');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const Center(child: Text('Loading...'));
        });
  }

  // data based on type
  static type({required Object type}) {
    return StreamBuilder(
        stream: storesCollection.where('type', isEqualTo: type).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, i) {
                final storesData = snapshot.data;
                DocumentSnapshot documentSnapshot = snapshot.data!.docs[i];
                return StoreTile(
                  headerImage: Constants.img,
                  title: storesData!.docs[i]['name'],
                  subtitle: storesData.docs[i]['type'],
                  address: storesData.docs[i]['address'],
                  onTap: () {
                    Get.to(() => StoreDetails(
                          documentSnapshot: documentSnapshot,
                        ));
                  },
                );
              },
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('error'),
            );
          }
          if (!snapshot.hasData) {
            return const Text('no data yet');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const Center(child: Text('Loading...'));
        });
  }

  //
  static Future<void> makeSuggestion(
      {required String id,
      required String name,
      required String type,
      required String address}) async {
    await suggestionsCollection.add({
      makeSuggestion(
        id: id,
        name: name,
        type: type,
        address: address,
      ),
    });
  }
}
