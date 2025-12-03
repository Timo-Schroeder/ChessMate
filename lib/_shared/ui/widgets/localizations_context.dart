import 'package:chessmate/_shared/ui/localization/app_localizations.dart';
import 'package:flutter/widgets.dart';

extension LocalizationsContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
