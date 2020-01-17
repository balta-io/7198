import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:todo/blocs/todo.bloc.dart';
import 'package:todo/components/button.widget.dart';
import 'package:todo/pages/home.page.dart';
import 'package:todo/stores/auth.store.dart';
import 'package:todo/stores/todo.store.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authStore = Provider.of<AuthStore>(context);
    final todoStore = Provider.of<TodoStore>(context);
    final todoBloc = new TodoBloc(todoStore);

    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final FirebaseAuth _auth = FirebaseAuth.instance;

    Future<FirebaseUser> _handleSignIn() async {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final FirebaseUser user =
          (await _auth.signInWithCredential(credential)).user;

      authStore.setUser(user.displayName, user.photoUrl, googleAuth.idToken);
      return user;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 60,
            left: 20,
            right: 20,
          ),
          child: Card(
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                ),
                Image.asset(
                  "assets/images/notification.png",
                  width: 250,
                ),
                Text(
                  "Olá desconhecido",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TDButton(
                  text: "Login com Google",
                  image: "assets/images/google.png",
                  callback: () {
                    _handleSignIn().then((FirebaseUser user) {
                      todoBloc.changeSelection("today");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    }).catchError((e) => print(e));
                  },
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
