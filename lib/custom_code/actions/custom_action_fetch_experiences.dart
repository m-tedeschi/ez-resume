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

Future<Map<String, dynamic>> buildExperienceData(
    List<String> documentIds) async {
  // Reference to the Firestore collection
  final experienceCollection =
      FirebaseFirestore.instance.collection('resExperience');

  // Initialize the structure to hold experience data
  Map<String, dynamic> experienceData = {};

  try {
    // Fetch each document and build the structure
    for (int i = 0; i < documentIds.length; i++) {
      String docId = documentIds[i];

      // Fetch the document
      DocumentSnapshot experienceDoc =
          await experienceCollection.doc(docId).get();

      if (experienceDoc.exists) {
        // Extract fields from the document
        String companyName = experienceDoc['companyName'] ?? '';
        String roleTitle = experienceDoc['roleTitle'] ?? '';
        String employmentType = experienceDoc['employmentType'] ?? '';
        String startDate = experienceDoc['startDate'] ?? '';
        String endDate = experienceDoc['endDate'] ?? '';
        List<dynamic> bulletPoints = experienceDoc['bulletPoints'] ?? [];

        // Add to the experienceData structure
        experienceData['experience${i + 1}'] = {
          'companyName': companyName,
          'roleTitle': roleTitle,
          'employmentType': employmentType,
          'startDate': startDate,
          'endDate': endDate,
          'bulletPoints': bulletPoints,
        };
      }
    }
  } catch (e) {
    // Handle errors appropriately (e.g., logging)
    print('Error fetching experiences: $e');
    rethrow;
  }

  return experienceData;
}

// Example usage within a Custom Action
Future<String> customActionFetchExperiences(List<String> documentIds) async {
  Map<String, dynamic> experienceData = await buildExperienceData(documentIds);

  // Convert the experienceData map to JSON-encoded string
  return jsonEncode(experienceData);
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
