import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'more_user_info_model.dart';
export 'more_user_info_model.dart';

class MoreUserInfoWidget extends StatefulWidget {
  const MoreUserInfoWidget({super.key});

  @override
  State<MoreUserInfoWidget> createState() => _MoreUserInfoWidgetState();
}

class _MoreUserInfoWidgetState extends State<MoreUserInfoWidget> {
  late MoreUserInfoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoreUserInfoModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'moreUserInfo'});
    _model.townFieldTextController ??= TextEditingController();
    _model.townFieldFocusNode ??= FocusNode();

    _model.stateFieldTextController ??= TextEditingController();
    _model.stateFieldFocusNode ??= FocusNode();

    _model.zipFieldTextController ??= TextEditingController();
    _model.zipFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFC8D6EE),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(-1.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                  child: Text(
                    'Almost Done!',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          fontSize: 42.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                ),
                Text(
                  'We just need a few more things from you!',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: Colors.black,
                        fontSize: 24.0,
                        letterSpacing: 0.0,
                      ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: SizedBox(
                            width: 200.0,
                            child: TextFormField(
                              controller: _model.townFieldTextController,
                              focusNode: _model.townFieldFocusNode,
                              onFieldSubmitted: (_) async {
                                logFirebaseEvent(
                                    'MORE_USER_INFO_townField_ON_TEXTFIELD_SU');
                                logFirebaseEvent('townField_update_app_state');
                                FFAppState().town =
                                    _model.townFieldTextController.text;
                                safeSetState(() {});
                              },
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                hintText: 'Enter Town/City...',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model.townFieldTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: SizedBox(
                            width: 200.0,
                            child: TextFormField(
                              controller: _model.stateFieldTextController,
                              focusNode: _model.stateFieldFocusNode,
                              onFieldSubmitted: (_) async {
                                logFirebaseEvent(
                                    'MORE_USER_INFO_stateField_ON_TEXTFIELD_S');
                                logFirebaseEvent('stateField_update_app_state');
                                FFAppState().state =
                                    _model.stateFieldTextController.text;
                                safeSetState(() {});
                              },
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                hintText: 'Enter State...',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model
                                  .stateFieldTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: SizedBox(
                            width: 200.0,
                            child: TextFormField(
                              controller: _model.zipFieldTextController,
                              focusNode: _model.zipFieldFocusNode,
                              onFieldSubmitted: (_) async {
                                logFirebaseEvent(
                                    'MORE_USER_INFO_zipField_ON_TEXTFIELD_SUB');
                                logFirebaseEvent('zipField_update_app_state');
                                FFAppState().zip =
                                    _model.zipFieldTextController.text;
                                safeSetState(() {});
                              },
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                hintText: 'Zip Code...',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model.zipFieldTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'MORE_USER_INFO_onboarding2Button_ON_TAP');
                      if (!(functions.validateTextField(
                              _model.townFieldTextController.text) &&
                          functions.validateTextField(
                              _model.stateFieldTextController.text) &&
                          functions.validateTextField(
                              _model.zipFieldTextController.text))) {
                        logFirebaseEvent('onboarding2Button_show_snack_bar');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Error: Please fill out all of the fields to continue!',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: const Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                        );
                        return;
                      }
                      logFirebaseEvent('onboarding2Button_backend_call');

                      await currentUserReference!.update(createUsersRecordData(
                        state: _model.stateFieldTextController.text,
                        town: _model.townFieldTextController.text,
                        zipCode: _model.zipFieldTextController.text,
                      ));
                      logFirebaseEvent('onboarding2Button_navigate_to');

                      context.pushNamed('menu');
                    },
                    text: 'Finish Registration!',
                    options: FFButtonOptions(
                      width: 250.0,
                      height: 43.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Inter Tight',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
