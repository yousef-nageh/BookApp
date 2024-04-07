import 'package:firebase_auth/firebase_auth.dart';

class FireBaseService{


  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> signInWithEmailPassword(
      String email, String password) async {

    return   await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

  }

 Future<void> sendEmailVerification() async{
   await _auth.currentUser?.sendEmailVerification();
  }
}