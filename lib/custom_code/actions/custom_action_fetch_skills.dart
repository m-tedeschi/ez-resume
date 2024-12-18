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

Future<Map<String, dynamic>> grabSkillsData(List<String> documentIds) async {
  // Reference to the Firestore collection
  final skillsCollection = FirebaseFirestore.instance.collection('resSkills');

  // Initialize the structure to hold skills data
  Map<String, dynamic> skillsData = {};

  try {
    String docId = documentIds[0];

    // Fetch the document
    DocumentSnapshot skillDoc = await skillsCollection.doc(docId).get();

    if (skillDoc.exists) {
      // Extract the 'skills' array from the document
      List<dynamic> skills = skillDoc['skills'] ?? [];

      // Add to the skillsData structure
      skillsData['skill1'] = {
        'skills': skills,
      };
    }
  } catch (e) {
    // Handle errors appropriately (e.g., logging)
    print('Error fetching skills: $e');
    rethrow;
  }

  return skillsData;
}

// Example usage within a Custom Action
Future<String> customActionFetchSkills(List<String> documentIds) async {
  Map<String, dynamic> skillsData = await grabSkillsData(documentIds);

  // Convert the skillsData map to JSON-encoded string
  return jsonEncode(skillsData);
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
