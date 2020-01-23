import 'dart:async';

import 'package:block_architecture_pattern/widgets/bloc_provider.dart';

class CounterBlock extends BlocBase {
  int _counter = 0;

  //// Stream to handle the counter
  StreamController<int> _counterController = StreamController<int>();
  Sink<int> get counterInput => _counterController.sink;
  Stream<int> get counterOutbut => _counterController.stream;
  //
  StreamController<int> _incrementController = StreamController<int>();
  Sink<int> get incrementInput => _incrementController.sink;
  Stream<int> get incrementOutbut => _incrementController.stream;
  //

  //constructor
  CounterBlock() {
    _counter = 0;
    _incrementController.stream.listen(_increment);
  }

  @override
  void dispose() {
    _counterController.close();
    _incrementController.close();
  }

  void _increment(data) {
    _counter++;
    counterInput.add(_counter);
  }
}
