import 'package:block_architecture_pattern/bloc_provider.dart';
import 'package:block_architecture_pattern/counter_sence/block/counter_block.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //
    final CounterBlock counterBlock = BlocProvider.of<CounterBlock>(context);
    //

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<int>(
              stream: counterBlock.counterOutbut,
              initialData: 0,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                return Text('${snapshot.data}',
                    style: Theme.of(context).textTheme.display1);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              counterBlock.incrementCounter.add(null);
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10.0),
          FloatingActionButton(
            onPressed: () {
              counterBlock.decrementCounter.add(null);
            },
            tooltip: 'Increment',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
