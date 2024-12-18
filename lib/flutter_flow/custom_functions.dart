import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String buildPdfUrlCustomFunction(String userId) {
  String url =
      'https://firebasestorage.googleapis.com/v0/b/ez-resume-hmpgul.appspot.com/o/ready-to-convert%2F${userId}.pdf?alt=media';
  return url;
}

bool validateTextField(String field) {
  if (field == '') {
    return false;
  }
  ;
  return true;
}

int getSkillListIndex(List<String> list) {
  return list.length;
}
