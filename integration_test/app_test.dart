import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:exchange_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Start application and fetch data", (tester) async {
    app.main();
    await tester.pumpAndSettle();

    final allTextWidgets = find.byType(Text);
    final matches = <String>[];

    allTextWidgets.evaluate().forEach((element) {
      final widget = element.widget as Text;
      final text = widget.data;
      if (text != null &&
          text.length == 3 &&
          RegExp(r'^[A-Z]{3}$').hasMatch(text)) {
        matches.add(text);
      }
    });
    // Cheeck that at least 5 tickers of 3 uppercase letters were found
    expect(matches.length, greaterThanOrEqualTo(5));
    // Check that at least 5 tickers of 3 uppercase letters were found
    
    await tester.drag(find.byType(ListView), const Offset(0, -500));
    // Scroll the ListView up to load more assets
    await tester.pumpAndSettle();

    // Check that application does not show any error messages
    expect(find.textContaining('Error'), findsNothing);
  });
}
