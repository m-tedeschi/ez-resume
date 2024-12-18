import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_experience_details_widget.dart' show AddExperienceDetailsWidget;
import 'package:flutter/material.dart';

class AddExperienceDetailsModel
    extends FlutterFlowModel<AddExperienceDetailsWidget> {
  ///  Local state fields for this page.

  String selectedOption = 'exp';

  ///  State fields for stateful widgets in this page.

  // State field(s) for detailField widget.
  FocusNode? detailFieldFocusNode;
  TextEditingController? detailFieldTextController;
  String? Function(BuildContext, String?)? detailFieldTextControllerValidator;
  // State field(s) for bulletsMenu widget.
  String? bulletsMenuValue;
  FormFieldController<String>? bulletsMenuValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    detailFieldFocusNode?.dispose();
    detailFieldTextController?.dispose();
  }
}
