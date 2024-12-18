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

Future<String> buildPdfUrl(String? userId) async {
  // Add your function code here!
  String? url =
      'https://firebasestorage.googleapis.com/v0/b/ez-resume-hmpgul.appspot.com/o/ready-to-convert%2F${userId}.pdf?alt=media';
  return url;
}
