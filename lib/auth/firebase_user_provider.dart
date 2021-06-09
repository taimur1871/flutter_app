import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class BitwearappFirebaseUser {
  BitwearappFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

BitwearappFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<BitwearappFirebaseUser> bitwearappFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<BitwearappFirebaseUser>(
            (user) => currentUser = BitwearappFirebaseUser(user));
