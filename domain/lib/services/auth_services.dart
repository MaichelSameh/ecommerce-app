import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } catch (error) {
      print(error);
      rethrow;
    }
  }

  Future<bool> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } catch (error) {
      print(error);
      rethrow;
    }
  }

  Future<bool> sendResetPasswordLink({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return true;
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}
