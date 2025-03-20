import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropmate/features/auth/presentation/widget/utility/show_snack_bar.dart';

class FirebaseStoreUserId {
  final FirebaseFirestore _firestore;
  FirebaseStoreUserId(this._firestore);
  Future<void> upLoadUserDetail({
    required String name,
    required String email,
    required String phone,
    required BuildContext context,
  }) async {
    try {
      await FirebaseFirestore.instance.collection("UserData").doc(name).set({
        "Name": name,
        "Email": email,
        "Phone": phone,
      });
      print(_firestore);
    } on FirebaseException catch (e) {
      showSnackBar(context, e.message!);
    }
  }
}
