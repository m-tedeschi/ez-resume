import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "skillsData" field.
  List<String>? _skillsData;
  List<String> get skillsData => _skillsData ?? const [];
  bool hasSkillsData() => _skillsData != null;

  // "experiencesData" field.
  List<String>? _experiencesData;
  List<String> get experiencesData => _experiencesData ?? const [];
  bool hasExperiencesData() => _experiencesData != null;

  // "educationData" field.
  List<String>? _educationData;
  List<String> get educationData => _educationData ?? const [];
  bool hasEducationData() => _educationData != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "town" field.
  String? _town;
  String get town => _town ?? '';
  bool hasTown() => _town != null;

  // "zip_code" field.
  String? _zipCode;
  String get zipCode => _zipCode ?? '';
  bool hasZipCode() => _zipCode != null;

  // "initializedEdu" field.
  bool? _initializedEdu;
  bool get initializedEdu => _initializedEdu ?? false;
  bool hasInitializedEdu() => _initializedEdu != null;

  // "initializedSkills" field.
  bool? _initializedSkills;
  bool get initializedSkills => _initializedSkills ?? false;
  bool hasInitializedSkills() => _initializedSkills != null;

  // "initializedExp" field.
  bool? _initializedExp;
  bool get initializedExp => _initializedExp ?? false;
  bool hasInitializedExp() => _initializedExp != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _skillsData = getDataList(snapshotData['skillsData']);
    _experiencesData = getDataList(snapshotData['experiencesData']);
    _educationData = getDataList(snapshotData['educationData']);
    _state = snapshotData['state'] as String?;
    _town = snapshotData['town'] as String?;
    _zipCode = snapshotData['zip_code'] as String?;
    _initializedEdu = snapshotData['initializedEdu'] as bool?;
    _initializedSkills = snapshotData['initializedSkills'] as bool?;
    _initializedExp = snapshotData['initializedExp'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? firstName,
  String? lastName,
  String? state,
  String? town,
  String? zipCode,
  bool? initializedEdu,
  bool? initializedSkills,
  bool? initializedExp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'first_name': firstName,
      'last_name': lastName,
      'state': state,
      'town': town,
      'zip_code': zipCode,
      'initializedEdu': initializedEdu,
      'initializedSkills': initializedSkills,
      'initializedExp': initializedExp,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        listEquality.equals(e1?.skillsData, e2?.skillsData) &&
        listEquality.equals(e1?.experiencesData, e2?.experiencesData) &&
        listEquality.equals(e1?.educationData, e2?.educationData) &&
        e1?.state == e2?.state &&
        e1?.town == e2?.town &&
        e1?.zipCode == e2?.zipCode &&
        e1?.initializedEdu == e2?.initializedEdu &&
        e1?.initializedSkills == e2?.initializedSkills &&
        e1?.initializedExp == e2?.initializedExp;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.firstName,
        e?.lastName,
        e?.skillsData,
        e?.experiencesData,
        e?.educationData,
        e?.state,
        e?.town,
        e?.zipCode,
        e?.initializedEdu,
        e?.initializedSkills,
        e?.initializedExp
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
