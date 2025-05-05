import 'package:filore/src/utils/exceptions.dart';
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
  Future<AuthResponse> signUpWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw FiloreExceptions('Unknown error occurred');
      }

      return response;
    } on AuthException catch (e) {
      // 🧠 Customize based on Supabase messages
      if (e.message.contains('already registered') || e.statusCode == '400') {
        throw FiloreExceptions(FiloreExceptions.userAlreadyExists());
      } else {
        throw FiloreExceptions(e.message); // fallback to raw Supabase message
      }
    } catch (_) {
      throw FiloreExceptions('Something went wrong. Please try again later.');
    }
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
