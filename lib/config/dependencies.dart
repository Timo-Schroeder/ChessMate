import 'package:chessmate/data/repositories/tournament_repository.dart';
import 'package:chessmate/data/services/database_service.dart';
import 'package:chessmate/data/services/database_service_impl.dart';
import 'package:chessmate/data/services/drift_database.dart';
import 'package:chessmate/domain/use_cases/tournament/tournament_use_case.dart';
import 'package:chessmate/ui/tournament_creation/view_model/tournament_creation_view_model.dart';
import 'package:chessmate/ui/tournament_selection/view_model/tournament_selection_view_model.dart';
import 'package:watch_it/watch_it.dart';

void setupLocator() {
  sl.registerSingleton<AppDatabase>(AppDatabase());

  sl.registerSingleton<DatabaseService>(
    DatabaseServiceImpl(sl<AppDatabase>())..init(),
  );

  sl.registerSingleton<TournamentRepository>(
    TournamentRepository(
      sl<DatabaseService>(),
    ),
  );

  sl.registerSingleton<TournamentUseCase>(
    TournamentUseCase()..loadInitialData(),
  );

  sl.registerSingleton<TournamentCreationViewModel>(
    TournamentCreationViewModel(),
  );

  sl.registerSingleton<TournamentSelectionViewModel>(
    TournamentSelectionViewModel(),
  );
}
