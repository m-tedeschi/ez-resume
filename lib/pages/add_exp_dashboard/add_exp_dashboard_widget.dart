import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_exp_dashboard_model.dart';
export 'add_exp_dashboard_model.dart';

class AddExpDashboardWidget extends StatefulWidget {
  const AddExpDashboardWidget({super.key});

  @override
  State<AddExpDashboardWidget> createState() => _AddExpDashboardWidgetState();
}

class _AddExpDashboardWidgetState extends State<AddExpDashboardWidget> {
  late AddExpDashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddExpDashboardModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'addExpDashboard'});
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Text(
                        'What type of experience do you  want to add?',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              fontSize: 32.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    Container(
                      width: 367.0,
                      height: 607.0,
                      decoration: const BoxDecoration(
                        color: Color(0xFFC8D6EE),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            '\nYou must have at least one experience  skill, and education entry before resume generation!\n\nAdd your most recent education and experiences first!',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 22.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'ADD_EXP_DASHBOARD_dashAddSkillsButton_ON');
                                  logFirebaseEvent(
                                      'dashAddSkillsButton_navigate_to');

                                  context.pushNamed('addSkills');
                                },
                                text: 'Add Skills ',
                                options: FFButtonOptions(
                                  width: 331.0,
                                  height: 45.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FFAppState().completeSkill
                                      ? FlutterFlowTheme.of(context).success
                                      : const Color(0xFF1A3B5D),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter Tight',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'ADD_EXP_DASHBOARD_dashAddEduButton_ON_TA');
                                  logFirebaseEvent(
                                      'dashAddEduButton_navigate_to');

                                  context.pushNamed(
                                    'addEducation',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: const TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                },
                                text: 'Add Education ',
                                options: FFButtonOptions(
                                  width: 331.0,
                                  height: 45.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FFAppState().completeEdu
                                      ? FlutterFlowTheme.of(context).success
                                      : const Color(0xFF1A3B5D),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter Tight',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'ADD_EXP_DASHBOARD_dashAddExpButton_ON_TA');
                                  logFirebaseEvent(
                                      'dashAddExpButton_navigate_to');

                                  context.pushNamed(
                                    'addExpScreen1',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: const TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                },
                                text: 'Add Experience ',
                                options: FFButtonOptions(
                                  width: 331.0,
                                  height: 45.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FFAppState().completeExp
                                      ? FlutterFlowTheme.of(context).success
                                      : const Color(0xFF1A3B5D),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter Tight',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'ADD_EXP_DASHBOARD_addExpDashBackButton_O');
                                  logFirebaseEvent(
                                      'addExpDashBackButton_navigate_to');

                                  context.pushNamed('menu');
                                },
                                text: 'Back',
                                options: FFButtonOptions(
                                  width: 331.0,
                                  height: 45.0,
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
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(height: 10.0)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
