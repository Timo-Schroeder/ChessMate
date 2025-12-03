import 'package:chessmate/data/repositories/player_repository.dart';
import 'package:chessmate/data/repositories/tournament_repository.dart';
import 'package:chessmate/data/services/database_service.dart';
import 'package:chessmate/data/services/database_service_impl.dart';
import 'package:chessmate/data/services/drift_database.dart';
import 'package:chessmate/domain/use_cases/tournament/tournament_manager.dart';
import 'package:chessmate/ui/player_management/view_model/player_management_view_model.dart';
import 'package:chessmate/ui/tournament_creation/view_model/tournament_creation_view_model.dart';
import 'package:flutter_it/flutter_it.dart';

void setupLocator() {
  sl.registerSingleton<AppDatabase>(AppDatabase.standard());

  sl.registerSingleton<DatabaseService>(
    DatabaseServiceImpl(sl<AppDatabase>())..init(),
  );

  sl.registerSingleton<TournamentRepository>(
    TournamentRepository(sl<DatabaseService>()),
  );

  sl.registerSingleton<PlayerRepository>(
    PlayerRepository(sl<DatabaseService>()),
  );

  sl.registerSingleton<TournamentManager>(
    TournamentManager(sl<TournamentRepository>()),
    dispose: (manager) => manager.dispose(),
  );

  sl.registerSingleton<PlayerManagementViewModel>(
    PlayerManagementViewModel(sl<PlayerRepository>()),
  );

  sl.registerSingleton<TournamentCreationViewModel>(
    TournamentCreationViewModel(sl<TournamentManager>()),
  );
}
