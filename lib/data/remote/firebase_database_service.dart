import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

class FirebaseDatabaseService {
  final _instance = FirebaseDatabase.instance;

  FirebaseDatabaseService();

  DatabaseReference ref([String? path, bool keepSynced = true]) {
    final reference = _instance.ref(path);
    reference.keepSynced(keepSynced);
    return reference;
  }

  StreamSubscription<DatabaseEvent> listen(
      [String? path, Function(DataSnapshot)? onData, bool keepSynced = true]) {
    final reference = ref(path, keepSynced);
    final subscription = reference.onValue.listen((DatabaseEvent event) {
      if (onData != null) {
        onData(event.snapshot);
      }
    });

    return subscription;
  }
}
