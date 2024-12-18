import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_skills_widget.dart' show AddSkillsWidget;
import 'package:flutter/material.dart';

class AddSkillsModel extends FlutterFlowModel<AddSkillsWidget> {
  ///  Local state fields for this page.

  String selectedSkill = 'skill';

  ///  State fields for stateful widgets in this page.

  // State field(s) for skillField widget.
  FocusNode? skillFieldFocusNode;
  TextEditingController? skillFieldTextController;
  String? Function(BuildContext, String?)? skillFieldTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ResSkillsRecord? newSkillsDocRef;
  // State field(s) for skillsList widget.
  String? skillsListValue;
  FormFieldController<String>? skillsListValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    skillFieldFocusNode?.dispose();
    skillFieldTextController?.dispose();
  }
}
