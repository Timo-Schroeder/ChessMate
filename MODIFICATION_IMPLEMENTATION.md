# Modification Implementation Plan

This document outlines the step-by-step plan to introduce unit tests and refactor the data layer of the Chessmate application.

## Journal

### Phase 1: Initial Setup and Testing `TournamentUseCase`

**Actions Taken:**
- Ran `flutter test` to confirm no existing tests.
- Added `mocktail` as a dev dependency.
- Resolved version conflict between `freezed` and `analyzer` by downgrading `analyzer` to `^8.4.1`.
- Created `test/mocks.dart` with `MockTournamentRepository`.
- Wrote unit tests for `TournamentUseCase` in `test/domain/use_cases/tournament/tournament_use_case_test.dart`.
- Fixed several analysis errors:
    - Corrected import paths for `TournamentRepository`.
    - Imported `watch_it` for `sl` instance.
    - Corrected `Tournament` constructor parameters in test data.
    - Re-added `implements TournamentRepository` to `MockTournamentRepository`.
    - Added `registerFallbackValue` for `Tournament` in `setUpAll`.
    - Used explicit type matchers in `verifyNever` calls for `updateTournament`.
- Ran `dart fix --apply`.
- Ran `dart analyze` (0 errors, 2 info).
- Ran `flutter test` for `TournamentUseCase` (all 10 tests passed).
- Ran `dart format .`.

**Learnings/Surprises/Deviations:**
- Encountered version conflicts with `freezed` and `analyzer` which required downgrading `analyzer`.
- Had to debug several analysis errors related to imports, `sl` usage, `Tournament` constructor, and `mocktail`'s `any()` matcher with custom types. This highlighted the importance of iterative testing and analysis.
- The `sl` instance is globally provided by `watch_it` (which re-exports `get_it`), so direct import of `watch_it` was necessary in the test file.

---

## Phase 1: Initial Setup and Testing `TournamentUseCase`

The first phase focuses on setting up the testing environment and writing tests for the core business logic in `TournamentUseCase`.

- [x] Run all existing tests to ensure the project is in a good state before starting modifications.
- [x] Add the `mocktail` package as a dev dependency for creating mocks.
- [x] Create a mock implementation of `TournamentRepository` in the `test` directory.
- [x] Write unit tests for `TournamentUseCase` (`test/domain/use_cases/tournament/tournament_use_case_test.dart`).
    - [x] Test initial state.
    - [x] Test `loadInitialData`.
    - [x] Test `createTournament`.
    - [x] Test `deleteTournament`.
    - [x] For each test, verify state changes and that `notifyListeners()` is called.
- [x] **Post-Phase Checklist:**
    - [x] Run `dart fix --apply` to clean up the code.
    - [x] Run `dart analyze` and fix any issues.
    - [x] Run the new tests to ensure they all pass.
    - [x] Run `dart format .` to ensure correct formatting.
    - [x] Re-read this `MODIFICATION_IMPLEMENTATION.md` file to check for any changes.
    - [x] Update the "Journal" section of this file with a summary of the phase.
    - [ ] Use `git diff` to verify the changes and prepare a commit message for approval.
    - [ ] Wait for user approval before committing.
    - [ ] After committing, use `hot_reload` if the app is running.

---

## Phase 2: Testing the Data Layer

This phase will add tests for the repository implementation.

- [ ] Create a mock for `DatabaseService` in the `test` directory.
- [ ] Write unit tests for `TournamentRepositoryImpl` (`test/data/repositories/tournament_repository_test.dart`).
    - [ ] Test `getAllTournaments`.
    - [ ] Test `createTournament`.
    - [ ] Test `deleteTournament`.
- [ ] **Post-Phase Checklist:**
    - [ ] Run `dart fix --apply` to clean up the code.
    - [ ] Run `dart analyze` and fix any issues.
    - [ ] Run all tests to ensure they all pass.
    - [ ] Run `dart format .` to ensure correct formatting.
    - [ ] Re-read this `MODIFICATION_IMPLEMENTATION.md` file to check for any changes.
    - [ ] Update the "Journal" section of this file with a summary of the phase.
    - [ ] Use `git diff` to verify the changes and prepare a commit message for approval.
    - [ ] Wait for user approval before committing.
    - [ ] After committing, use `hot_reload` if the app is running.

---

## Phase 3: Widget Tests

This phase will add widget tests to verify the UI behaves as expected.

- [ ] Write widget tests for `TournamentSelectionScreen` (`test/ui/tournament_selection/widgets/tournament_selection_screen_test.dart`).
    - [ ] Mock `TournamentSelectionViewModel`.
    - [ ] Test that the list of tournaments is displayed.
    - [ ] Test that tapping the "create" button navigates to the creation screen.
- [ ] Write widget tests for `TournamentCreationScreen` (`test/ui/tournament_creation/widgets/tournament_creation_screen_test.dart`).
    - [ ] Mock `TournamentCreationViewModel`.
    - [ ] Test form input and validation.
    - [ ] Test that tapping the "save" button calls the appropriate method on the view model.
- [ ] **Post-Phase Checklist:**
    - [ ] Run `dart fix --apply` to clean up the code.
    - [ ] Run `dart analyze` and fix any issues.
    - [ ] Run all tests to ensure they all pass.
    - [ ] Run `dart format .` to ensure correct formatting.
    - [ ] Re-read this `MODIFICATION_IMPLEMENTATION.md` file to check for any changes.
    - [ ] Update the "Journal" section of this file with a summary of the phase.
    - [ ] Use `git diff` to verify the changes and prepare a commit message for approval.
    - [_] Wait for user approval before committing.
    - [ ] After committing, use `hot_reload` if the app is running.

---

## Phase 4: Refactoring to Drift - Setup

This phase sets up the new `drift`-based database.

- [ ] Create the file `lib/data/services/drift_database.dart`.
- [ ] In this new file, define the `Tournaments` table and the `AppDatabase` class.
- [ ] Run `dart run build_runner build --delete-conflicting-outputs` to generate the required `*.g.dart` file.
- [ ] **Post-Phase Checklist:**
    - [ ] Run `dart fix --apply` to clean up the code.
    - [ ] Run `dart analyze` and fix any issues.
    - [ ] Run all tests to ensure they all pass.
    - [ ] Run `dart format .` to ensure correct formatting.
    - [ ] Re-read this `MODIFICATION_IMPLEMENTATION.md` file to check for any changes.
    - [ ] Update the "Journal" section of this file with a summary of the phase.
    - [ ] Use `git diff` to verify the changes and prepare a commit message for approval.
    - [ ] Wait for user approval before committing.
    - [ ] After committing, use `hot_reload` if the app is running.

---

## Phase 5: Refactoring to Drift - Implementation & Migration

This phase will switch the application to use the new `drift` database.

- [ ] Modify `lib/data/services/database_service.dart` to use the generated `AppDatabase` from `drift` instead of raw `sqflite` calls.
- [ ] Update `lib/utils/locator.dart` to initialize and register the new `AppDatabase` and the refactored database service.
- [ ] Update the unit tests for `TournamentRepositoryImpl` to use the new `drift`-based database service (or a mock of it).
- [ ] **Post-Phase Checklist:**
    - [ ] Run `dart fix --apply` to clean up the code.
    - [ ] Run `dart analyze` and fix any issues.
    - [ ] Run all tests to ensure they all pass.
    - [ ] Run `dart format .` to ensure correct formatting.
    - [ ] Re-read this `MODIFICATION_IMPLEMENTATION.md` file to check for any changes.
    - [ ] Update the "Journal" section of this file with a summary of the phase.
    - [ ] Use `git diff` to verify the changes and prepare a commit message for approval.
    - [ ] Wait for user approval before committing.
    - [ ] After committing, use `hot_reload` if the app is running.

---

## Phase 6: Finalization

This final phase cleans up and ensures the project is ready for future development.

- [ ] Review and update the `README.md` file if any changes are needed to reflect the new database implementation.
- [ ] Create a `GEMINI.md` file in the project root to describe the app's purpose, architecture, and file layout for future reference by the Gemini agent.
- [ ] Ask the user to inspect the package and the running application to confirm they are satisfied with the modifications.
- [ ] **Post-Phase Checklist:**
    - [ ] Run `dart fix --apply` to clean up the code.
    - [ ] Run `dart analyze` and fix any issues.
    - [ ] Run all tests to ensure they all pass.
    - [ ] Run `dart format .` to ensure correct formatting.
    -
    - [ ] Re-read this `MODIFICATION_IMPLEMENTATION.md` file to check for any changes.
    - [ ] Update the "Journal" section of this file with a summary of the phase.
    - [ ] Use `git diff` to verify the changes and prepare a commit message for approval.
    - [ ] Wait for user approval before committing.
    - [ ] After committing, use `hot_reload` if the app is running.

---
*After completing a task, if you added any TODOs to the code or didn't fully implement anything, make sure to add new tasks so that you can come back and complete them later.*
