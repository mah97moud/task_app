import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_app/layouts/home/home_layout.dart';
import 'package:task_app/modules/google_login/cubit/states.dart';
import 'package:task_app/shared/components.dart';

class GoogleLoginCubit extends Cubit<GoogleLoginStates> {
  GoogleLoginCubit() : super(InitState());
  // static GoogleLoginCubit get() =>
  static GoogleLoginCubit get(context) => BlocProvider.of(context);

  Future<UserCredential> signInWithGoogle({BuildContext context}) async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) {
      emit(SuccessState());
      print(value.user.email);
      navigateTo(
          context: context,
          widget: HomeLayout(
            userName: value.user.displayName,
          ));
    }).catchError((error) {
      emit(ErrorState(error.toString()));
      print(error.toString());
    });
  }
}
