import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shelves/main.dart';

void main() {
  testWidgets('App renders with tab bar', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: ShelvesApp(),
      ),
    );

    // Verify the app title is present in the app bar
    expect(find.text('Library'), findsWidgets);
  });
}
