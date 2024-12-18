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

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<Map<String, dynamic>> buildEducationData(
    List<String> documentIds) async {
  // Reference to the Firestore collection
  final educationCollection =
      FirebaseFirestore.instance.collection('resEducation');

  // Initialize the structure to hold education data
  Map<String, dynamic> educationData = {};

  try {
    // Fetch each document and build the structure
    for (int i = 0; i < documentIds.length; i++) {
      String docId = documentIds[i];

      // Fetch the document
      DocumentSnapshot educationDoc =
          await educationCollection.doc(docId).get();

      if (educationDoc.exists) {
        // Extract fields from the document
        String degree = educationDoc['degree'] ?? '';
        String end = educationDoc['end'] ?? '';
        String location = educationDoc['location'] ?? '';
        String school = educationDoc['school'] ?? '';
        String start = educationDoc['start'] ?? '';

        // Add to the educationData structure
        educationData['school${i + 1}'] = {
          'school': school,
          'degree': degree,
          'start': start,
          'end': end,
          'location': location,
        };
      }
    }
  } catch (e) {
    // Handle errors appropriately (e.g., logging)
    print('Error fetching education: $e');
    rethrow;
  }

  return educationData;
}

// Example usage within a Custom Action
Future<String> customActionFetchEducation(List<String> documentIds) async {
  Map<String, dynamic> educationData = await buildEducationData(documentIds);

  // Convert the educationData map to JSON-encoded string
  return jsonEncode(educationData);
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
