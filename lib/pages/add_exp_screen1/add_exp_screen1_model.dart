import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_exp_screen1_widget.dart' show AddExpScreen1Widget;
import 'package:flutter/material.dart';

class AddExpScreen1Model extends FlutterFlowModel<AddExpScreen1Widget> {
  ///  Local state fields for this page.

  String company = 'company';

  String role = 'role';

  String employment = 'employment';

  String startDate = 'start';

  String endDate = 'end';

  ///  State fields for stateful widgets in this page.

  // State field(s) for cnameField widget.
  FocusNode? cnameFieldFocusNode;
  TextEditingController? cnameFieldTextController;
  String? Function(BuildContext, String?)? cnameFieldTextControllerValidator;
  // State field(s) for roleTitleField widget.
  FocusNode? roleTitleFieldFocusNode;
  TextEditingController? roleTitleFieldTextController;
  String? Function(BuildContext, String?)?
      roleTitleFieldTextControllerValidator;
  // State field(s) for eTypeField widget.
  FocusNode? eTypeFieldFocusNode;
  TextEditingController? eTypeFieldTextController;
  String? Function(BuildContext, String?)? eTypeFieldTextControllerValidator;
  // State field(s) for startDateField widget.
  FocusNode? startDateFieldFocusNode;
  TextEditingController? startDateFieldTextController;
  String? Function(BuildContext, String?)?
      startDateFieldTextControllerValidator;
  // State field(s) for endDateField widget.
  FocusNode? endDateFieldFocusNode;
  TextEditingController? endDateFieldTextController;
  String? Function(BuildContext, String?)? endDateFieldTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in expNextButton widget.
  ResExperienceRecord? newExpDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    cnameFieldFocusNode?.dispose();
    cnameFieldTextController?.dispose();

    roleTitleFieldFocusNode?.dispose();
    roleTitleFieldTextController?.dispose();

    eTypeFieldFocusNode?.dispose();
    eTypeFieldTextController?.dispose();

    startDateFieldFocusNode?.dispose();
    startDateFieldTextController?.dispose();

    endDateFieldFocusNode?.dispose();
    endDateFieldTextController?.dispose();
  }
}
