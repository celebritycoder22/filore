import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  //sign in with email and password
  Future<AuthResponse> signInwithEmailPassword(
      {required String email, required String password}) async {
    return await _supabase.auth
        .signInWithPassword(email: email, password: password);
  }

  //sign up with email and password
  Future<AuthResponse> signUpWithEmailPassword(
      {required String email, required String password}) async {
    return await _supabase.auth.signUp(email: email, password: password);
  }

  //log user out
  Future<void> signOut() async {
    return await _supabase.auth.signOut();
  }

  //fetch filorian's email address
  String? getCurrentFilorianEmail() {
    final session = _supabase.auth.currentSession;
    final user = session?.user;
    return user?.email;
  }
}
