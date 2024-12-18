import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_education_widget.dart' show AddEducationWidget;
import 'package:flutter/material.dart';

class AddEducationModel extends FlutterFlowModel<AddEducationWidget> {
  ///  Local state fields for this page.

  String school = 'school';

  String degree = 'degree';

  String location = 'location';

  String startDate = 'startDate';

  String endDate = 'endDate';

  String gpa = 'gpa';

  ///  State fields for stateful widgets in this page.

  // State field(s) for schoolNameField widget.
  FocusNode? schoolNameFieldFocusNode;
  TextEditingController? schoolNameFieldTextController;
  String? Function(BuildContext, String?)?
      schoolNameFieldTextControllerValidator;
  // State field(s) for degreeNameField widget.
  FocusNode? degreeNameFieldFocusNode;
  TextEditingController? degreeNameFieldTextController;
  String? Function(BuildContext, String?)?
      degreeNameFieldTextControllerValidator;
  // State field(s) for schoolLocationField widget.
  FocusNode? schoolLocationFieldFocusNode;
  TextEditingController? schoolLocationFieldTextController;
  String? Function(BuildContext, String?)?
      schoolLocationFieldTextControllerValidator;
  // State field(s) for schoolStartField widget.
  FocusNode? schoolStartFieldFocusNode;
  TextEditingController? schoolStartFieldTextController;
  String? Function(BuildContext, String?)?
      schoolStartFieldTextControllerValidator;
  // State field(s) for schoolEndField widget.
  FocusNode? schoolEndFieldFocusNode;
  TextEditingController? schoolEndFieldTextController;
  String? Function(BuildContext, String?)?
      schoolEndFieldTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in addEducationButton widget.
  ResEducationRecord? newEduDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    schoolNameFieldFocusNode?.dispose();
    schoolNameFieldTextController?.dispose();

    degreeNameFieldFocusNode?.dispose();
    degreeNameFieldTextController?.dispose();

    schoolLocationFieldFocusNode?.dispose();
    schoolLocationFieldTextController?.dispose();

    schoolStartFieldFocusNode?.dispose();
    schoolStartFieldTextController?.dispose();

    schoolEndFieldFocusNode?.dispose();
    schoolEndFieldTextController?.dispose();
  }
}
