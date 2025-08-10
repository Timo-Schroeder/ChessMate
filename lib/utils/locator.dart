import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart'
    show databaseFactory, databaseFactoryFfi, sqfliteFfiInit;

import '../data/repositories/tournament_repository.dart';
import '../data/services/database_service.dart';
import '../domain/use_cases/tournament/tournament_use_case.dart';
import '../ui/tournament_creation/view_model/tournament_creation_view_model.dart';
import '../ui/tournament_selection/view_model/tournament_selection_view_model.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<DatabaseService>(
    () {
      if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
        sqfliteFfiInit();

        return DatabaseService(databaseFactory: databaseFactoryFfi);
      } else {
        return DatabaseService(databaseFactory: databaseFactory);
      }
    },
  );

  locator.registerLazySingleton<TournamentRepository>(
    () => TournamentRepositoryImpl(),
  );

  locator.registerLazySingleton<TournamentUseCase>(
    () => TournamentUseCase(),
  );

  locator.registerLazySingleton<TournamentCreationViewModel>(
    () => TournamentCreationViewModel(),
  );

  locator.registerLazySingleton<TournamentSelectionViewModel>(
    () => TournamentSelectionViewModel(),
  );
}
