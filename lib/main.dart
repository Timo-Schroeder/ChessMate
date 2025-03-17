import 'package:chessmatey/ui/tournament_selection/widgets/tournament_selection_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaru/yaru.dart';

Future<void> main() async {
  await YaruWindowTitleBar.ensureInitialized();

  if (kIsWeb) {
    throw UnsupportedError('Web is not supported');
  }

  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return YaruTheme(builder: (context, yaru, _) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: yaru.theme,
        darkTheme: yaru.darkTheme,
        themeMode: ThemeMode.light,
        home: const TournamentSelectionScreen(),
      );
    });
  }
}
