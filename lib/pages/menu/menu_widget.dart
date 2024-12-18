import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'menu_model.dart';
export 'menu_model.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  late MenuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'menu'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MENU_PAGE_menu_ON_INIT_STATE');
      logFirebaseEvent('menu_update_app_state');
      FFAppState().completeSkill =
          valueOrDefault<bool>(currentUserDocument?.initializedSkills, false);
      safeSetState(() {});
      logFirebaseEvent('menu_update_app_state');
      FFAppState().completeExp =
          valueOrDefault<bool>(currentUserDocument?.initializedExp, false);
      safeSetState(() {});
      logFirebaseEvent('menu_update_app_state');
      FFAppState().completeEdu =
          valueOrDefault<bool>(currentUserDocument?.initializedEdu, false);
      safeSetState(() {});
    });

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
          child: Container(
            width: 1711.0,
            height: 1037.0,
            decoration: const BoxDecoration(
              color: Color(0xFFC8D6EE),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/logo-no-background.png',
                          width: 300.0,
                          height: 50.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 1842.0,
                    height: 118.0,
                    decoration: const BoxDecoration(
                      color: Color(0xFFC8D6EE),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: Text(
                            'Welcome!',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 50.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Text(
                          'What would you like to do?',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 1859.0,
                    height: 347.0,
                    decoration: const BoxDecoration(
                      color: Color(0xFFC8D6EE),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 50.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'MENU_PAGE_CREATE_RESUME_BTN_ON_TAP');
                              logFirebaseEvent('Button_backend_call');

                              await ResumeRecord.collection
                                  .doc()
                                  .set(createResumeRecordData(
                                    email: FFAppState().to,
                                    firstName: FFAppState().firstName,
                                    lastName: FFAppState().lastname,
                                    phoneNumber: FFAppState().phone,
                                    uid: FFAppState().userID,
                                  ));
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed('addExpDashboard');
                            },
                            text: 'Create Resume',
                            options: FFButtonOptions(
                              width: 250.0,
                              height: 43.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: const Color(0xFF1A3B5D),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Inter Tight',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        if (FFAppState().completeEdu &&
                            FFAppState().completeExp &&
                            FFAppState().completeSkill)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('MENU_PAGE_dumpJSON_ON_TAP');
                                logFirebaseEvent('dumpJSON_custom_action');
                                _model.skillsJSON =
                                    await actions.customActionFetchSkills(
                                  (currentUserDocument?.skillsData.toList() ??
                                          [])
                                      .toList(),
                                );
                                logFirebaseEvent('dumpJSON_custom_action');
                                _model.expJSON =
                                    await actions.customActionFetchExperiences(
                                  (currentUserDocument?.experiencesData
                                              .toList() ??
                                          [])
                                      .toList(),
                                );
                                logFirebaseEvent('dumpJSON_custom_action');
                                _model.educationJSON =
                                    await actions.customActionFetchEducation(
                                  (currentUserDocument?.educationData
                                              .toList() ??
                                          [])
                                      .toList(),
                                );
                                logFirebaseEvent('dumpJSON_update_app_state');
                                FFAppState().debugValue = _model.educationJSON!;
                                safeSetState(() {});
                                logFirebaseEvent('dumpJSON_custom_action');
                                await actions.createResumeFile(
                                  currentUserUid,
                                  _model.skillsJSON!,
                                  _model.expJSON!,
                                  _model.educationJSON!,
                                );
                                logFirebaseEvent('dumpJSON_navigate_to');

                                context.pushNamed('downloadEditPage');

                                safeSetState(() {});
                              },
                              text: 'Generate and View Resume!',
                              options: FFButtonOptions(
                                width: 250.0,
                                height: 43.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xFF1A3B5D),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 45.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent('MENU_PAGE_LOG_OUT_BTN_ON_TAP');
                              logFirebaseEvent('Button_auth');
                              GoRouter.of(context).prepareAuthEvent();
                              await authManager.signOut();
                              GoRouter.of(context).clearRedirectLocation();

                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamedAuth(
                                  'AuthPage', context.mounted);
                            },
                            text: 'Log Out',
                            options: FFButtonOptions(
                              width: 250.0,
                              height: 43.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: const Color(0xFF1A3B5D),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
