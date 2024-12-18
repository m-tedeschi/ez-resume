import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResExperienceRecord extends FirestoreRecord {
  ResExperienceRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "users" field.
  DocumentReference? _users;
  DocumentReference? get users => _users;
  bool hasUsers() => _users != null;

  // "companyName" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  bool hasCompanyName() => _companyName != null;

  // "roleTitle" field.
  String? _roleTitle;
  String get roleTitle => _roleTitle ?? '';
  bool hasRoleTitle() => _roleTitle != null;

  // "employmentType" field.
  String? _employmentType;
  String get employmentType => _employmentType ?? '';
  bool hasEmploymentType() => _employmentType != null;

  // "startDate" field.
  String? _startDate;
  String get startDate => _startDate ?? '';
  bool hasStartDate() => _startDate != null;

  // "endDate" field.
  String? _endDate;
  String get endDate => _endDate ?? '';
  bool hasEndDate() => _endDate != null;

  // "bulletPoints" field.
  List<String>? _bulletPoints;
  List<String> get bulletPoints => _bulletPoints ?? const [];
  bool hasBulletPoints() => _bulletPoints != null;

  void _initializeFields() {
    _users = snapshotData['users'] as DocumentReference?;
    _companyName = snapshotData['companyName'] as String?;
    _roleTitle = snapshotData['roleTitle'] as String?;
    _employmentType = snapshotData['employmentType'] as String?;
    _startDate = snapshotData['startDate'] as String?;
    _endDate = snapshotData['endDate'] as String?;
    _bulletPoints = getDataList(snapshotData['bulletPoints']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('resExperience');

  static Stream<ResExperienceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ResExperienceRecord.fromSnapshot(s));

  static Future<ResExperienceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ResExperienceRecord.fromSnapshot(s));

  static ResExperienceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ResExperienceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ResExperienceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ResExperienceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ResExperienceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ResExperienceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createResExperienceRecordData({
  DocumentReference? users,
  String? companyName,
  String? roleTitle,
  String? employmentType,
  String? startDate,
  String? endDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'users': users,
      'companyName': companyName,
      'roleTitle': roleTitle,
      'employmentType': employmentType,
      'startDate': startDate,
      'endDate': endDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class ResExperienceRecordDocumentEquality
    implements Equality<ResExperienceRecord> {
  const ResExperienceRecordDocumentEquality();

  @override
  bool equals(ResExperienceRecord? e1, ResExperienceRecord? e2) {
    const listEquality = ListEquality();
    return e1?.users == e2?.users &&
        e1?.companyName == e2?.companyName &&
        e1?.roleTitle == e2?.roleTitle &&
        e1?.employmentType == e2?.employmentType &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        listEquality.equals(e1?.bulletPoints, e2?.bulletPoints);
  }

  @override
  int hash(ResExperienceRecord? e) => const ListEquality().hash([
        e?.users,
        e?.companyName,
        e?.roleTitle,
        e?.employmentType,
        e?.startDate,
        e?.endDate,
        e?.bulletPoints
      ]);

  @override
  bool isValidKey(Object? o) => o is ResExperienceRecord;
}
