import '/flutter_flow/flutter_flow_util.dart';
import 'more_user_info_widget.dart' show MoreUserInfoWidget;
import 'package:flutter/material.dart';

class MoreUserInfoModel extends FlutterFlowModel<MoreUserInfoWidget> {
  ///  Local state fields for this page.

  bool selectedButton = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for townField widget.
  FocusNode? townFieldFocusNode;
  TextEditingController? townFieldTextController;
  String? Function(BuildContext, String?)? townFieldTextControllerValidator;
  // State field(s) for stateField widget.
  FocusNode? stateFieldFocusNode;
  TextEditingController? stateFieldTextController;
  String? Function(BuildContext, String?)? stateFieldTextControllerValidator;
  // State field(s) for zipField widget.
  FocusNode? zipFieldFocusNode;
  TextEditingController? zipFieldTextController;
  String? Function(BuildContext, String?)? zipFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    townFieldFocusNode?.dispose();
    townFieldTextController?.dispose();

    stateFieldFocusNode?.dispose();
    stateFieldTextController?.dispose();

    zipFieldFocusNode?.dispose();
    zipFieldTextController?.dispose();
  }
}
