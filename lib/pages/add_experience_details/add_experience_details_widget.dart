import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'add_experience_details_model.dart';
export 'add_experience_details_model.dart';

class AddExperienceDetailsWidget extends StatefulWidget {
  const AddExperienceDetailsWidget({super.key});

  @override
  State<AddExperienceDetailsWidget> createState() =>
      _AddExperienceDetailsWidgetState();
}

class _AddExperienceDetailsWidgetState
    extends State<AddExperienceDetailsWidget> {
  late AddExperienceDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddExperienceDetailsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'addExperienceDetails'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ADD_EXPERIENCE_DETAILS_addExperienceDeta');
      logFirebaseEvent('addExperienceDetails_update_app_state');
      FFAppState().addToExpBullets(_model.detailFieldTextController.text);
      safeSetState(() {});
      logFirebaseEvent('addExperienceDetails_show_snack_bar');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Detail Added!',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: const Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );
    });

    _model.detailFieldTextController ??= TextEditingController();
    _model.detailFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                  child: Text(
                    'Add Details',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          fontSize: 42.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: Text(
                    'Now, add the details!\nThese will become your bullet\npoints for the experience.',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                        ),
                  ),
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
                          width: 350.0,
                          child: TextFormField(
                            controller: _model.detailFieldTextController,
                            focusNode: _model.detailFieldFocusNode,
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
                              hintText: 'Increased revenue by 50%...',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFE9E9E9),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFE9E9E9),
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
                              fillColor: const Color(0xFFE9E9E9),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.detailFieldTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(width: 25.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent(
                        'ADD_EXPERIENCE_DETAILS_ADD_DETAIL_BTN_ON');
                    if (functions.validateTextField(
                            _model.detailFieldTextController.text) ==
                        true) {
                      logFirebaseEvent('Button_update_app_state');
                      FFAppState().addToExperiences(
                          _model.detailFieldTextController.text);
                      safeSetState(() {});
                      logFirebaseEvent('Button_show_snack_bar');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Detail Added!',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor: FlutterFlowTheme.of(context).success,
                        ),
                      );
                      logFirebaseEvent('Button_clear_text_fields_pin_codes');
                      safeSetState(() {
                        _model.detailFieldTextController?.clear();
                      });
                    } else {
                      logFirebaseEvent('Button_show_snack_bar');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Error: Please type a detail before hitting Add Detail!',
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
                  },
                  text: 'Add Detail',
                  options: FFButtonOptions(
                    width: 279.0,
                    height: 43.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: const Color(0xFF1A3B5D),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter Tight',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Text(
                'Your Details For This Experience:',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      fontSize: 32.0,
                      letterSpacing: 0.0,
                    ),
              ),
              FlutterFlowDropDown<String>(
                key: ValueKey(_model.detailFieldTextController.text),
                controller: _model.bulletsMenuValueController ??=
                    FormFieldController<String>(null),
                options: FFAppState().experiences,
                onChanged: (val) async {
                  safeSetState(() => _model.bulletsMenuValue = val);
                  logFirebaseEvent('ADD_EXPERIENCE_DETAILS_bulletsMenu_ON_FO');
                  logFirebaseEvent('bulletsMenu_update_page_state');
                  _model.selectedOption = _model.bulletsMenuValue!;
                  safeSetState(() {});
                },
                width: MediaQuery.sizeOf(context).width * 0.7,
                height: 40.0,
                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
                hintText: 'Select Detail...',
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                elevation: 2.0,
                borderColor: Colors.transparent,
                borderWidth: 0.0,
                borderRadius: 8.0,
                margin: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                hidesUnderline: true,
                isOverButton: false,
                isSearchable: false,
                isMultiSelect: false,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent(
                        'ADD_EXPERIENCE_DETAILS_DELETE_DETAIL_BTN');
                    logFirebaseEvent('Button_update_app_state');
                    FFAppState().removeFromExperiences(_model.selectedOption);
                    safeSetState(() {});
                  },
                  text: 'Delete Detail',
                  options: FFButtonOptions(
                    width: 279.0,
                    height: 43.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: const Color(0xFF1A3B5D),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter Tight',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent(
                        'ADD_EXPERIENCE_DETAILS_ADD_EXPERIENCE_BT');
                    if (functions.getSkillListIndex(
                            FFAppState().experiences.toList()) <
                        random_data.randomInteger(1, 1)) {
                      logFirebaseEvent('Button_show_snack_bar');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Error details list is empty!',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor: FlutterFlowTheme.of(context).error,
                        ),
                      );
                      return;
                    } else {
                      logFirebaseEvent('Button_backend_call');

                      await currentUserReference!.update({
                        ...mapToFirestore(
                          {
                            'experiencesData': FieldValue.arrayUnion(
                                [FFAppState().currentExpDocRef?.id]),
                          },
                        ),
                      });
                      logFirebaseEvent('Button_backend_call');

                      await FFAppState().currentExpDocRef!.update({
                        ...mapToFirestore(
                          {
                            'bulletPoints': FFAppState().experiences,
                          },
                        ),
                      });
                      logFirebaseEvent('Button_backend_call');

                      await currentUserReference!.update(createUsersRecordData(
                        initializedExp: true,
                      ));
                      logFirebaseEvent('Button_update_app_state');
                      FFAppState().completeExp = true;
                      safeSetState(() {});
                      logFirebaseEvent('Button_update_app_state');
                      FFAppState().experiences = [];
                      safeSetState(() {});
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed('addExpDashboard');
                    }
                  },
                  text: 'Add Experience',
                  options: FFButtonOptions(
                    width: 279.0,
                    height: 43.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: const Color(0xFF1A3B5D),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter Tight',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('ADD_EXPERIENCE_DETAILS_BACK_BTN_ON_TAP');
                    logFirebaseEvent('Button_navigate_to');

                    context.pushNamed('addExpDashboard');
                  },
                  text: 'Back',
                  options: FFButtonOptions(
                    width: 279.0,
                    height: 43.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: const Color(0xFF1A3B5D),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter Tight',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ].divide(const SizedBox(height: 15.0)),
          ),
        ),
      ),
    );
  }
}
