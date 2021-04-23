import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/shared/cubit/cubit.dart';
import 'package:task_app/shared/cubit/states.dart';

class SettingsScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController urlControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Enter Url To Search'),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              width: 1.0,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: TextFormField(
                            controller: urlControl,
                            textAlign: TextAlign.center,
                            cursorHeight: 25.0,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'https://www.google.com',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Correct url';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50.0),
                          child: Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  AppCubit.get(context).searchUrl(
                                    url: urlControl.text,
                                    context: context,
                                  );
                                  urlControl.clear();
                                }
                              },
                              child: Text('Search'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
