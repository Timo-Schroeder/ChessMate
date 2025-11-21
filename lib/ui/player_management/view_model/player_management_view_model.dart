import 'dart:developer';

import 'package:chessmate/data/repositories/player_repository.dart';
import 'package:chessmate/domain/models/player/fide_title.dart';
import 'package:chessmate/domain/models/player/gender.dart';
import 'package:chessmate/domain/models/player/player.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:watch_it/watch_it.dart';

class PlayerManagementViewModel extends SafeChangeNotifier {
  final _playerRepository = sl<PlayerRepository>();

  List<Player> _players = [];

  String _playerCreationFirstName = '';
  String _playerCreationLastName = '';
  int _playerCreationYearOfBirth = -1;
  Gender _playerCreationGender = Gender.male;
  int? _playerCreationNationalRating;
  int? _playerCreationElo;
  String _playerCreationClub = '';
  FideTitle _playerCreationFideTitle = FideTitle.none;

  String _playerCreationFirstNameError = '';
  String _playerCreationLastNameError = '';
  String _playerCreationYearOfBirthError = '';

  IList<Player> get players => _players.lock;

  String get playerCreationFirstName => _playerCreationFirstName;
  String get playerCreationLastName => _playerCreationLastName;
  int? get playerCreationYearOfBirth => _playerCreationYearOfBirth;
  Gender get playerCreationGender => _playerCreationGender;
  int? get playerCreationNationalRating => _playerCreationNationalRating;
  int? get playerCreationElo => _playerCreationElo;
  String get playerCreationClub => _playerCreationClub;
  FideTitle get playerCreationFideTitle => _playerCreationFideTitle;

  String get playerCreationFirstNameError => _playerCreationFirstNameError;
  String get playerCreationLastNameError => _playerCreationFirstNameError;
  String get playerCreationYearOfBirthError => _playerCreationYearOfBirthError;

  set playerCreationFirstName(String firstName) {
    _playerCreationFirstName = firstName;
    if (_playerCreationFirstName.isNotEmpty) {
      _playerCreationFirstNameError = '';
    }
    notifyListeners();
  }

  set playerCreationLastName(String lastName) {
    _playerCreationLastName = lastName;
    if (_playerCreationLastName.isNotEmpty) {
      _playerCreationLastNameError = '';
    }
    notifyListeners();
  }

  set playerCreationYearOfBirth(int yearOfBirth) {
    _playerCreationYearOfBirth = yearOfBirth;
    if (_playerCreationYearOfBirth != -1) {
      _playerCreationYearOfBirthError = '';
    }
    notifyListeners();
  }

  set playerCreationGender(Gender gender) {
    _playerCreationGender = gender;
    notifyListeners();
  }

  set playerCreationNationalRating(int? nationalRating) {
    _playerCreationNationalRating = nationalRating;
    notifyListeners();
  }

  set playerCreationElo(int? elo) {
    _playerCreationElo = elo;
    notifyListeners();
  }

  set playerCreationClub(String club) {
    _playerCreationClub = club;
    notifyListeners();
  }

  set playerCreationFideTitle(FideTitle fideTitle) {
    _playerCreationFideTitle = fideTitle;
    notifyListeners();
  }

  Future<void> fetchPlayers(int tournamentId) async {
    try {
      final fetchedPlayers = await _playerRepository.getPlayersInTournament(
        tournamentId,
      );
      fetchedPlayers.fold(
        (error) => _players = [],
        (list) => _players = list.toList(),
      );
    } catch (e) {
      log('Could not load players in tournament');
    }

    notifyListeners();
  }

  Future<bool> addPlayer(int tournamentId) async {
    _playerCreationFirstNameError = '';
    _playerCreationLastNameError = '';

    notifyListeners();

    if (_playerCreationFirstName.isEmpty) {
      _playerCreationFirstNameError = 'First name cannot be empty';
    }

    if (_playerCreationLastName.isEmpty) {
      _playerCreationLastNameError = 'Last name cannot be empty';
    }

    if (_playerCreationYearOfBirth == -1) {
      _playerCreationYearOfBirthError = 'Year of Birth cannot be empty';
    }

    if (_playerCreationFirstNameError.isNotEmpty ||
        _playerCreationLastNameError.isNotEmpty ||
        _playerCreationYearOfBirthError.isNotEmpty) {
      notifyListeners();

      return false;
    }

    final player = Player(
      firstName: _playerCreationFirstName,
      lastName: _playerCreationLastName,
      yearOfBirth: _playerCreationYearOfBirth,
      gender: _playerCreationGender,
      nationalRating: _playerCreationNationalRating,
      elo: _playerCreationElo,
      club: _playerCreationClub,
      title: _playerCreationFideTitle,
      active: true,
      tournamentId: tournamentId,
    );
    await _playerRepository.createPlayer(player);

    _playerCreationFirstName = '';
    _playerCreationLastName = '';
    _playerCreationYearOfBirth = -1;
    _playerCreationGender = Gender.male;
    _playerCreationNationalRating = null;
    _playerCreationElo = null;
    _playerCreationClub = '';
    _playerCreationFideTitle = FideTitle.none;

    _playerCreationFirstNameError = '';
    _playerCreationLastNameError = '';

    await fetchPlayers(tournamentId);

    return true;
  }

  void cancelPlayerAddition() {
    _playerCreationFirstName = '';
    _playerCreationLastName = '';
    _playerCreationYearOfBirth = -1;
    _playerCreationGender = Gender.male;
    _playerCreationNationalRating = null;
    _playerCreationElo = null;
    _playerCreationClub = '';
    _playerCreationFideTitle = FideTitle.none;

    _playerCreationFirstNameError = '';
    _playerCreationLastNameError = '';

    notifyListeners();
  }
}
