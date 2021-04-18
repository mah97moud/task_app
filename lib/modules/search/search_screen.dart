import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/shared/cubit/cubit.dart';
import 'package:task_app/shared/cubit/states.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SearchScreen extends StatefulWidget {
  final String url;

  const SearchScreen({this.url});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              widget.url,
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: WebView(
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}

//
