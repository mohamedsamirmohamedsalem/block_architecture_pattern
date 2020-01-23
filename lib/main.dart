import 'package:block_architecture_pattern/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:block_architecture_pattern/counter_sence/widgets/MyHome_Page.dart';
import 'counter_sence/block/counter_block.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<CounterBlock>(
        bloc: CounterBlock(),
        child: MyHomePage(
          title: 'title',
        ),
      ),
    );
  }
}
