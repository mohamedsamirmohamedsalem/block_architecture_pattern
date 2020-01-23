import 'package:block_architecture_pattern/widgets/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:block_architecture_pattern/widgets/MyHome_Page.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        bloc: BlocProvider(),
        child: MyHomePage(),
      ),
    );
  }
}
