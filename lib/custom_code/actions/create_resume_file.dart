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

Future<void> createResumeFile(String fName, String skillsDataJSON,
    String expDataJSON, String eduDataJSON) async {
  // note: let fName also be the user's uid
  // for easier user doc referencing!
  var userDataJSON; // establish container

  try {
    // Reference to the 'users' collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    // Fetch the user's document by ID
    DocumentSnapshot userDoc = await users.doc(fName).get();

    // Check if the document exists
    if (userDoc.exists) {
      // Convert the document data to JSON
      Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;

      // Convert Timestamps to ISO8601 strings
      userData.forEach((key, value) {
        if (value is Timestamp) {
          userData[key] = value.toDate().toIso8601String();
        }
      });

      userDataJSON = jsonEncode(userData);
    } else {
      throw Exception('User not found');
    }
  } catch (e) {
    print("Error: Error grabbing stuff from User Doc (doc was found)");
    print(e);
  }

  final url = Uri.parse(
      'https://us-central1-ez-resume-hmpgul.cloudfunctions.net/buildResumeTex');
  final response = await http.post(url, body: {
    'content': userDataJSON,
    'fName': fName,
    'skillsDataJSON': skillsDataJSON,
    'expDataJSON': expDataJSON,
    'eduDataJSON': eduDataJSON,
  });

  if (response.statusCode == 200) {
    print('File created successfully');
  } else {
    print('Failed to create file: ${response.body}');
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
