import 'dart:io';

import 'package:sqflite_common_ffi/sqflite_ffi.dart'
    show databaseFactory, databaseFactoryFfi, sqfliteFfiInit;
import 'package:watch_it/watch_it.dart' show sl;

import '../data/repositories/tournament_repository.dart';
import '../data/services/database_service.dart';
import '../domain/use_cases/tournament/tournament_use_case.dart';
import '../ui/tournament_creation/view_model/tournament_creation_view_model.dart';
import '../ui/tournament_selection/view_model/tournament_selection_view_model.dart';

void setupLocator() {
  sl.registerLazySingleton<DatabaseService>(
    () {
      if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
        sqfliteFfiInit();

        return DatabaseService(databaseFactory: databaseFactoryFfi);
      } else {
        return DatabaseService(databaseFactory: databaseFactory);
      }
    },
  );

  sl.registerLazySingleton<TournamentRepository>(
    () => TournamentRepositoryImpl(),
  );

  sl.registerLazySingleton<TournamentUseCase>(
    () => TournamentUseCase(),
  );

  sl.registerLazySingleton<TournamentCreationViewModel>(
    () => TournamentCreationViewModel(),
  );

  sl.registerLazySingleton<TournamentSelectionViewModel>(
    () => TournamentSelectionViewModel(),
  );
}
