import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/modules/home/home_screen.dart';
import 'package:task_app/modules/search/search_screen.dart';
import 'package:task_app/modules/settings/settings_screen.dart';
import 'package:task_app/shared/components.dart';
import 'package:task_app/shared/cubit/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitStates());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  String urlName = '';

  List<Widget> screenList = [
    HomeScreen(),
    SettingsScreen(),
  ];
  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeIndexState());
  }

  void searchUrl({@required BuildContext context, @required String url}) {
    try {
      navigateTo(
        context: context,
        widget: SearchScreen(
          url: url ?? 'https://www.google.com/',
        ),
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
