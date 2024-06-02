import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/page/accessibility_settings.dart';

void main() {
  
  setUp(() {

  });

  testWidgets("Initial settings correct", (WidgetTester tester) async {
    const key = Key("key");
    await tester.pumpWidget(MaterialApp(home: AccessibilitySettings(key: key)));
    var finder = find.byKey(Key('Toggle'));
    expect(finder, findsOneWidget);

    AccessibilitySettingsState state = tester.state(find.byKey(key));

  //if themeMode is light
    state.provider.setTheme('light');
    state.args = {'currentTheme' : state.provider};
    expect(state.provider.themeMode, ThemeMode.light);
    state.setSelections();
    expect(state.selections, [true, false]);
  //if themeMode is dark
    state.provider.setTheme('dark');
    state.args = {'currentTheme' : state.provider};
    expect(state.provider.themeMode, ThemeMode.dark);
    state.setSelections();
    expect(state.selections, [false, true]);
  });
}