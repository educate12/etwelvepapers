import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

import 'auth_util.dart';

class EtwelvePapersFirebaseUser {
  EtwelvePapersFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

EtwelvePapersFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<EtwelvePapersFirebaseUser> etwelvePapersFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<EtwelvePapersFirebaseUser>(
      (user) {
        currentUser = EtwelvePapersFirebaseUser(user);
        updateUserJwtTimer(user);
        return currentUser!;
      },
    );
