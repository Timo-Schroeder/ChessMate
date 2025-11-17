import 'package:chessmate/data/repositories/player_repository.dart';
import 'package:chessmate/domain/models/player/fide_title.dart';
import 'package:chessmate/domain/models/player/gender.dart';
import 'package:chessmate/domain/models/player/player.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:watch_it/watch_it.dart';

class PlayerManagementViewModel extends SafeChangeNotifier {
  final _playerRepository = sl<PlayerRepository>();

  String _playerCreationFirstName = '';
  String _playerCreationLastName = '';
  int _playerCreationYearOfBirth = 2000;
  Gender _playerCreationGender = Gender.male;
  int? _playerCreationNationalRating;
  int? _playerCreationElo;
  String _playerCreationClub = '';
  FideTitle _playerCreationFideTitle = FideTitle.none;

  String _playerCreationFirstNameError = '';
  String _playerCreationLastNameError = '';

  String get playerCreationFirstName => _playerCreationFirstName;
  String get playerCreationLastName => _playerCreationLastName;
  int get playerCreationYearOfBirth => _playerCreationYearOfBirth;
  Gender get playerCreationGender => _playerCreationGender;
  int? get playerCreationNationalRating => _playerCreationNationalRating;
  int? get playerCreationElo => _playerCreationElo;
  String get playerCreationClub => _playerCreationClub;
  FideTitle get playerCreationFideTitle => _playerCreationFideTitle;

  String get playerCreationFirstNameError => _playerCreationFirstNameError;
  String get playerCreationLastNameError => _playerCreationFirstNameError;

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

  bool addPlayer(int tournamentId) {
    _playerCreationFirstNameError = '';
    _playerCreationLastNameError = '';

    notifyListeners();

    if (_playerCreationFirstName.isEmpty) {
      _playerCreationFirstNameError = 'First name cannot be empty';
    }

    if (_playerCreationLastName.isEmpty) {
      _playerCreationLastNameError = 'Last name cannot be empty';
    }

    if (_playerCreationFirstNameError.isNotEmpty ||
        _playerCreationLastNameError.isNotEmpty) {
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
    _playerRepository.createPlayer(player);

    _playerCreationFirstName = '';
    _playerCreationLastName = '';
    _playerCreationYearOfBirth = 2000;
    _playerCreationGender = Gender.male;
    _playerCreationNationalRating = null;
    _playerCreationElo = null;
    _playerCreationClub = '';
    _playerCreationFideTitle = FideTitle.none;

    _playerCreationFirstNameError = '';
    _playerCreationLastNameError = '';

    return true;
  }

  void cancelPlayerAddition() {
    _playerCreationFirstName = '';
    _playerCreationLastName = '';
    _playerCreationYearOfBirth = 2000;
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
