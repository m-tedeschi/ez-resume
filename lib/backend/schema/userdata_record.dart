import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserdataRecord extends FirestoreRecord {
  UserdataRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userdata');

  static Stream<UserdataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserdataRecord.fromSnapshot(s));

  static Future<UserdataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserdataRecord.fromSnapshot(s));

  static UserdataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserdataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserdataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserdataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserdataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserdataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserdataRecordData({
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserdataRecordDocumentEquality implements Equality<UserdataRecord> {
  const UserdataRecordDocumentEquality();

  @override
  bool equals(UserdataRecord? e1, UserdataRecord? e2) {
    return e1?.user == e2?.user;
  }

  @override
  int hash(UserdataRecord? e) => const ListEquality().hash([e?.user]);

  @override
  bool isValidKey(Object? o) => o is UserdataRecord;
}
