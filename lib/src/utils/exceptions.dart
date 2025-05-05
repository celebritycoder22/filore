import 'package:supabase_flutter/supabase_flutter.dart';

class FiloreExceptions extends AuthException {
  FiloreExceptions(super.message);

  static String userAlreadyExists() {
    return 'oops Filoré user already exists';
  }
}
