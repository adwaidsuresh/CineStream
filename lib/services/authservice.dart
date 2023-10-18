import 'package:firebase_auth/firebase_auth.dart';

class Authservices {
  static final auth = FirebaseAuth.instance;
  static Stream<User?> authSateChange() => auth.authStateChanges();

  static Future<UserCredential> login(String email, String password) {
    return auth.signInWithEmailAndPassword(email: email, password: password);
  }

  static Future<UserCredential> signup(String email, String password) {
    return auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  static Future<void> logout() {
    return auth.signOut();
  }
}

