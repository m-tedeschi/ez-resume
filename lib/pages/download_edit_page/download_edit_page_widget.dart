import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'download_edit_page_model.dart';
export 'download_edit_page_model.dart';

class DownloadEditPageWidget extends StatefulWidget {
  const DownloadEditPageWidget({super.key});

  @override
  State<DownloadEditPageWidget> createState() => _DownloadEditPageWidgetState();
}

class _DownloadEditPageWidgetState extends State<DownloadEditPageWidget> {
  late DownloadEditPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DownloadEditPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'downloadEditPage'});
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Text(
                  'Here is your new resume!',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        fontSize: 42.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              FlutterFlowPdfViewer(
                networkPath:
                    functions.buildPdfUrlCustomFunction(currentUserUid),
                height: 480.0,
                horizontalScroll: false,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('DOWNLOAD_EDIT_downloadButton_ON_TAP');
                    logFirebaseEvent('downloadButton_custom_action');
                    _model.newPdfUrl = await actions.buildPdfUrl(
                      currentUserUid,
                    );
                    logFirebaseEvent('downloadButton_launch_u_r_l');
                    await launchURL(_model.newPdfUrl!);

                    safeSetState(() {});
                  },
                  text: 'Download!',
                  options: FFButtonOptions(
                    width: 250.0,
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
                    logFirebaseEvent('DOWNLOAD_EDIT_backButton_ON_TAP');
                    logFirebaseEvent('backButton_navigate_to');

                    context.pushNamed('menu');
                  },
                  text: 'Back',
                  options: FFButtonOptions(
                    width: 250.0,
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
            ],
          ),
        ),
      ),
    );
  }
}
