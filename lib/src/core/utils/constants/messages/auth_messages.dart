import 'package:easy_localization/easy_localization.dart';
import 'package:standered_application/generated/locale_keys.g.dart';
import 'package:standered_application/src/core/utils/constants/messages/general_messages.dart';

class SignUpMessages extends GeneralMessages {
  String get numberAlreadyExist => LocaleKeys.this_number_is_already_exist.tr();
}
