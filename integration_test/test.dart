import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ez_resume/flutter_flow/flutter_flow_drop_down.dart';

import 'package:ez_resume/flutter_flow/flutter_flow_widgets.dart';
import 'package:ez_resume/flutter_flow/flutter_flow_theme.dart';
import 'package:ez_resume/index.dart';
import 'package:ez_resume/main.dart';
import 'package:ez_resume/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';
import 'package:ez_resume/backend/firebase/firebase_config.dart';
import 'package:ez_resume/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();
  });

  setUp(() async {
    await authManager.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
  });

  group('UserStory2Group', () {});

  testWidgets('User Story 2 User Login', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(),
    ));

    await tester.tap(find.byKey(ValueKey('LoginTab_h4v8')));
    await tester.tap(find.byKey(ValueKey('Login-Email_bmlt')));
    await tester.enterText(find.byKey(ValueKey('Login-Email_bmlt')),
        'valid_credentials@gmail.com');
    await tester.tap(find.byKey(ValueKey('Login-Password_g2ny')));
    await tester.enterText(
        find.byKey(ValueKey('Login-Password_g2ny')), 'validPassword123');
    await tester.tap(find.text('Log In'));
    await tester.pumpAndSettle(
      Duration(milliseconds: 3000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 10000),
    );
    expect(find.text('Welcome,'), findsOneWidget);
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}
