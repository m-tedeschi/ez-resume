// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convert/convert.dart';

Future<String> fetchDocAndEncode(String collectionId, String documentId) async {
  // for easier user doc referencing!
  var userDataJSON; // establish container

  try {
    // Reference to the 'users' collection
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection(collectionId);

    // Fetch the user's document by ID
    DocumentSnapshot docRef = await collectionRef.doc(documentId).get();

    // Check if the document exists
    if (docRef.exists) {
      // Convert the document data to JSON
      Map<String, dynamic> userData = docRef.data() as Map<String, dynamic>;

      // Convert Timestamps to ISO8601 strings
      userData.forEach((key, value) {
        if (value is Timestamp) {
          userData[key] = value.toDate().toIso8601String();
        }
      });

      userDataJSON = jsonEncode(userData);
    } else {
      throw Exception('Document not found / unhandled error');
    }
  } catch (e) {
    print("Error: Error grabbing stuff from collection");
    print(e);
  }

  return userDataJSON;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
