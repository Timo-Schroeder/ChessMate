import 'dart:io';

import 'package:sqflite_common_ffi/sqflite_ffi.dart'
    show databaseFactory, databaseFactoryFfi;

import 'package:chessmate/data/repositories/tournament_repository.dart';
import 'package:chessmate/data/services/database_service.dart'; // Import the abstract class
import 'package:chessmate/data/services/database_service_impl.dart'; // Import the implementation
import 'package:chessmate/domain/use_cases/tournament/tournament_use_case.dart';
import 'package:chessmate/ui/tournament_creation/view_model/tournament_creation_view_model.dart';
import 'package:chessmate/ui/tournament_selection/view_model/tournament_selection_view_model.dart';
import 'package:watch_it/watch_it.dart';

Future<void> setupLocator() async {
  final dbService = DatabaseServiceImpl(
    // Use the implementation class
    databaseFactory: Platform.isLinux || Platform.isWindows || Platform.isMacOS
        ? databaseFactoryFfi
        : databaseFactory,
  );
  await dbService.init();
  sl.registerSingleton<DatabaseService>(dbService); // Register the abstraction

  sl.registerLazySingleton<TournamentRepository>(
    () => TournamentRepositoryImpl(
      sl<DatabaseService>(),
    ), // Provide DatabaseService
  );

  sl.registerSingleton<TournamentUseCase>(
    TournamentUseCase(),
  );
  sl<TournamentUseCase>().loadInitialData();

  sl.registerLazySingleton<TournamentCreationViewModel>(
    () => TournamentCreationViewModel(),
  );

  sl.registerLazySingleton<TournamentSelectionViewModel>(
    () => TournamentSelectionViewModel(),
  );
}
