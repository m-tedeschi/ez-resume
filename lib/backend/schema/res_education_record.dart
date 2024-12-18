import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResEducationRecord extends FirestoreRecord {
  ResEducationRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "degree" field.
  String? _degree;
  String get degree => _degree ?? '';
  bool hasDegree() => _degree != null;

  // "end" field.
  String? _end;
  String get end => _end ?? '';
  bool hasEnd() => _end != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "school" field.
  String? _school;
  String get school => _school ?? '';
  bool hasSchool() => _school != null;

  // "start" field.
  String? _start;
  String get start => _start ?? '';
  bool hasStart() => _start != null;

  // "users" field.
  DocumentReference? _users;
  DocumentReference? get users => _users;
  bool hasUsers() => _users != null;

  void _initializeFields() {
    _degree = snapshotData['degree'] as String?;
    _end = snapshotData['end'] as String?;
    _location = snapshotData['location'] as String?;
    _school = snapshotData['school'] as String?;
    _start = snapshotData['start'] as String?;
    _users = snapshotData['users'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('resEducation');

  static Stream<ResEducationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ResEducationRecord.fromSnapshot(s));

  static Future<ResEducationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ResEducationRecord.fromSnapshot(s));

  static ResEducationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ResEducationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ResEducationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ResEducationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ResEducationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ResEducationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createResEducationRecordData({
  String? degree,
  String? end,
  String? location,
  String? school,
  String? start,
  DocumentReference? users,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'degree': degree,
      'end': end,
      'location': location,
      'school': school,
      'start': start,
      'users': users,
    }.withoutNulls,
  );

  return firestoreData;
}

class ResEducationRecordDocumentEquality
    implements Equality<ResEducationRecord> {
  const ResEducationRecordDocumentEquality();

  @override
  bool equals(ResEducationRecord? e1, ResEducationRecord? e2) {
    return e1?.degree == e2?.degree &&
        e1?.end == e2?.end &&
        e1?.location == e2?.location &&
        e1?.school == e2?.school &&
        e1?.start == e2?.start &&
        e1?.users == e2?.users;
  }

  @override
  int hash(ResEducationRecord? e) => const ListEquality()
      .hash([e?.degree, e?.end, e?.location, e?.school, e?.start, e?.users]);

  @override
  bool isValidKey(Object? o) => o is ResEducationRecord;
}
