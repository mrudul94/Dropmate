import 'package:firebase_core/firebase_core.dart';
import 'package:dropmate/firebase_options.dart';
import 'package:flutter/foundation.dart';

/// Initializes Firebase for the app.
Future<void> initializeFirebase() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    debugPrint("🔥 Firebase Initialization Error: $e");
  }
}
