import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResumeRecord extends FirestoreRecord {
  ResumeRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "users" field.
  DocumentReference? _users;
  DocumentReference? get users => _users;
  bool hasUsers() => _users != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _uid = snapshotData['uid'] as String?;
    _users = snapshotData['users'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('resume');

  static Stream<ResumeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ResumeRecord.fromSnapshot(s));

  static Future<ResumeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ResumeRecord.fromSnapshot(s));

  static ResumeRecord fromSnapshot(DocumentSnapshot snapshot) => ResumeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ResumeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ResumeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ResumeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ResumeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createResumeRecordData({
  String? email,
  String? firstName,
  String? lastName,
  String? phoneNumber,
  String? uid,
  DocumentReference? users,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'uid': uid,
      'users': users,
    }.withoutNulls,
  );

  return firestoreData;
}

class ResumeRecordDocumentEquality implements Equality<ResumeRecord> {
  const ResumeRecordDocumentEquality();

  @override
  bool equals(ResumeRecord? e1, ResumeRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.uid == e2?.uid &&
        e1?.users == e2?.users;
  }

  @override
  int hash(ResumeRecord? e) => const ListEquality().hash(
      [e?.email, e?.firstName, e?.lastName, e?.phoneNumber, e?.uid, e?.users]);

  @override
  bool isValidKey(Object? o) => o is ResumeRecord;
}
