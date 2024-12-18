import '/flutter_flow/flutter_flow_util.dart';
import 'onboarding_widget.dart' show OnboardingWidget;
import 'package:flutter/material.dart';

class OnboardingModel extends FlutterFlowModel<OnboardingWidget> {
  ///  Local state fields for this page.

  String firstName = 'Fname';

  String lastName = 'LName';

  String phoneNumber = 'phone';

  ///  State fields for stateful widgets in this page.

  // State field(s) for fnameField widget.
  FocusNode? fnameFieldFocusNode;
  TextEditingController? fnameFieldTextController;
  String? Function(BuildContext, String?)? fnameFieldTextControllerValidator;
  // State field(s) for lnameField widget.
  FocusNode? lnameFieldFocusNode;
  TextEditingController? lnameFieldTextController;
  String? Function(BuildContext, String?)? lnameFieldTextControllerValidator;
  // State field(s) for phoneField widget.
  FocusNode? phoneFieldFocusNode;
  TextEditingController? phoneFieldTextController;
  String? Function(BuildContext, String?)? phoneFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    fnameFieldFocusNode?.dispose();
    fnameFieldTextController?.dispose();

    lnameFieldFocusNode?.dispose();
    lnameFieldTextController?.dispose();

    phoneFieldFocusNode?.dispose();
    phoneFieldTextController?.dispose();
  }
}
