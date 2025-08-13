import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

import 'package:chessmate/domain/use_cases/tournament/tournament_use_case.dart';
import 'package:chessmate/l10n/app_localizations.dart';
import 'package:chessmate/utils/locator.dart';
import 'package:chessmate/utils/router.dart';

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
    return YaruTheme(
      builder: (context, yaru, _) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: yaru.theme,
          darkTheme: yaru.darkTheme,
          themeMode: ThemeMode.system,
          routerConfig: router,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        );
      },
    );
  }
}
