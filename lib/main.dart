import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

import 'domain/use_cases/tournament/tourament_use_case.dart';
import 'ui/tournament_selection/widgets/tournament_selection_screen.dart';
import 'utils/locator.dart';

Future<void> main() async {
  await YaruWindowTitleBar.ensureInitialized();

  if (kIsWeb) {
    throw UnsupportedError('Web is not supported');
  }

  setupLocator();
  await locator<TournamentUseCase>().init();

  runApp(const MyApp());
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
