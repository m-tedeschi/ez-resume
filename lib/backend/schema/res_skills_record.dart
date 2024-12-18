import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResSkillsRecord extends FirestoreRecord {
  ResSkillsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "skills" field.
  List<String>? _skills;
  List<String> get skills => _skills ?? const [];
  bool hasSkills() => _skills != null;

  // "users" field.
  DocumentReference? _users;
  DocumentReference? get users => _users;
  bool hasUsers() => _users != null;

  void _initializeFields() {
    _skills = getDataList(snapshotData['skills']);
    _users = snapshotData['users'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('resSkills');

  static Stream<ResSkillsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ResSkillsRecord.fromSnapshot(s));

  static Future<ResSkillsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ResSkillsRecord.fromSnapshot(s));

  static ResSkillsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ResSkillsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ResSkillsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ResSkillsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ResSkillsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ResSkillsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createResSkillsRecordData({
  DocumentReference? users,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'users': users,
    }.withoutNulls,
  );

  return firestoreData;
}

class ResSkillsRecordDocumentEquality implements Equality<ResSkillsRecord> {
  const ResSkillsRecordDocumentEquality();

  @override
  bool equals(ResSkillsRecord? e1, ResSkillsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.skills, e2?.skills) &&
        e1?.users == e2?.users;
  }

  @override
  int hash(ResSkillsRecord? e) =>
      const ListEquality().hash([e?.skills, e?.users]);

  @override
  bool isValidKey(Object? o) => o is ResSkillsRecord;
}
