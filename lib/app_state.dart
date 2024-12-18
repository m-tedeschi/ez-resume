import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _to = '';
  String get to => _to;
  set to(String value) {
    _to = value;
  }

  String _subject = '';
  String get subject => _subject;
  set subject(String value) {
    _subject = value;
  }

  String _text = '';
  String get text => _text;
  set text(String value) {
    _text = value;
  }

  String _companyName = '';
  String get companyName => _companyName;
  set companyName(String value) {
    _companyName = value;
  }

  String _roleTitle = '';
  String get roleTitle => _roleTitle;
  set roleTitle(String value) {
    _roleTitle = value;
  }

  String _firstName = 'name';
  String get firstName => _firstName;
  set firstName(String value) {
    _firstName = value;
  }

  String _employmentType = '';
  String get employmentType => _employmentType;
  set employmentType(String value) {
    _employmentType = value;
  }

  String _startDate = '';
  String get startDate => _startDate;
  set startDate(String value) {
    _startDate = value;
  }

  String _endDate = '';
  String get endDate => _endDate;
  set endDate(String value) {
    _endDate = value;
  }

  String _email = '';
  String get email => _email;
  set email(String value) {
    _email = value;
  }

  String _schoolName = '';
  String get schoolName => _schoolName;
  set schoolName(String value) {
    _schoolName = value;
  }

  String _degree = '';
  String get degree => _degree;
  set degree(String value) {
    _degree = value;
  }

  String _location = '';
  String get location => _location;
  set location(String value) {
    _location = value;
  }

  String _GPA = '';
  String get GPA => _GPA;
  set GPA(String value) {
    _GPA = value;
  }

  List<String> _skills = [];
  List<String> get skills => _skills;
  set skills(List<String> value) {
    _skills = value;
  }

  void addToSkills(String value) {
    skills.add(value);
  }

  void removeFromSkills(String value) {
    skills.remove(value);
  }

  void removeAtIndexFromSkills(int index) {
    skills.removeAt(index);
  }

  void updateSkillsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    skills[index] = updateFn(_skills[index]);
  }

  void insertAtIndexInSkills(int index, String value) {
    skills.insert(index, value);
  }

  String _lastname = '';
  String get lastname => _lastname;
  set lastname(String value) {
    _lastname = value;
  }

  String _phone = '';
  String get phone => _phone;
  set phone(String value) {
    _phone = value;
  }

  String _userID = '';
  String get userID => _userID;
  set userID(String value) {
    _userID = value;
  }

  List<String> _skill = [];
  List<String> get skill => _skill;
  set skill(List<String> value) {
    _skill = value;
  }

  void addToSkill(String value) {
    skill.add(value);
  }

  void removeFromSkill(String value) {
    skill.remove(value);
  }

  void removeAtIndexFromSkill(int index) {
    skill.removeAt(index);
  }

  void updateSkillAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    skill[index] = updateFn(_skill[index]);
  }

  void insertAtIndexInSkill(int index, String value) {
    skill.insert(index, value);
  }

  List<String> _expBullets = [];
  List<String> get expBullets => _expBullets;
  set expBullets(List<String> value) {
    _expBullets = value;
  }

  void addToExpBullets(String value) {
    expBullets.add(value);
  }

  void removeFromExpBullets(String value) {
    expBullets.remove(value);
  }

  void removeAtIndexFromExpBullets(int index) {
    expBullets.removeAt(index);
  }

  void updateExpBulletsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    expBullets[index] = updateFn(_expBullets[index]);
  }

  void insertAtIndexInExpBullets(int index, String value) {
    expBullets.insert(index, value);
  }

  List<String> _experiences = [];
  List<String> get experiences => _experiences;
  set experiences(List<String> value) {
    _experiences = value;
  }

  void addToExperiences(String value) {
    experiences.add(value);
  }

  void removeFromExperiences(String value) {
    experiences.remove(value);
  }

  void removeAtIndexFromExperiences(int index) {
    experiences.removeAt(index);
  }

  void updateExperiencesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    experiences[index] = updateFn(_experiences[index]);
  }

  void insertAtIndexInExperiences(int index, String value) {
    experiences.insert(index, value);
  }

  String _pdfUrl = '';
  String get pdfUrl => _pdfUrl;
  set pdfUrl(String value) {
    _pdfUrl = value;
  }

  DocumentReference? _currentExpDocRef;
  DocumentReference? get currentExpDocRef => _currentExpDocRef;
  set currentExpDocRef(DocumentReference? value) {
    _currentExpDocRef = value;
  }

  String _debugValue = '';
  String get debugValue => _debugValue;
  set debugValue(String value) {
    _debugValue = value;
  }

  String _zip = '';
  String get zip => _zip;
  set zip(String value) {
    _zip = value;
  }

  String _state = '';
  String get state => _state;
  set state(String value) {
    _state = value;
  }

  String _town = '';
  String get town => _town;
  set town(String value) {
    _town = value;
  }

  bool _completeEdu = false;
  bool get completeEdu => _completeEdu;
  set completeEdu(bool value) {
    _completeEdu = value;
  }

  bool _completeExp = false;
  bool get completeExp => _completeExp;
  set completeExp(bool value) {
    _completeExp = value;
  }

  bool _completeSkill = false;
  bool get completeSkill => _completeSkill;
  set completeSkill(bool value) {
    _completeSkill = value;
  }
}
