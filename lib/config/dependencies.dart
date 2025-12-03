import 'package:chessmate/_features/players/_managers/player_manager.dart';
import 'package:chessmate/_features/tournaments/_managers/tournament_creation_form_manager.dart';
import 'package:chessmate/_features/tournaments/_managers/tournament_manager.dart';
import 'package:chessmate/_shared/services/local/database_service.dart';
import 'package:chessmate/_shared/services/local/database_service_impl.dart';
import 'package:chessmate/_shared/services/local/drift_database.dart';
import 'package:flutter_it/flutter_it.dart';

void setupLocator() {
  sl.registerSingleton<AppDatabase>(AppDatabase.standard());

  sl.registerSingleton<DatabaseService>(
    DatabaseServiceImpl(sl<AppDatabase>())..init(),
  );

  sl.registerSingleton<TournamentManager>(
    TournamentManager(sl<DatabaseService>()),
    dispose: (manager) => manager.dispose(),
  );

  sl.registerSingleton<PlayerManager>(PlayerManager(sl<DatabaseService>()));

  sl.registerSingleton<TournamentCreationFormManager>(
    TournamentCreationFormManager(sl<TournamentManager>()),
  );
}
