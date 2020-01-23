import 'dart:async';
import 'package:block_architecture_pattern/bloc_provider.dart';

class CounterBlock extends BlocBase {
  int _counter = 0;

  //// Stream to handle the counter
  StreamController<int> _counterController = StreamController<int>();
  Sink<int> get counterInput => _counterController.sink;
  Stream<int> get counterOutbut => _counterController.stream;
  //
  StreamController<int> _incrementController = StreamController<int>();
  Sink<int> get incrementCounter => _incrementController.sink;
  //
  StreamController<int> _decrementController = StreamController<int>();
  Sink<int> get decrementCounter => _decrementController.sink;
  //
  void _increment(data) {
    _counter++;
    counterInput.add(_counter);
  }

  void _decrement(data) {
    _counter--;
    counterInput.add(_counter);
  }

  //constructor
  CounterBlock() {
    _counter = 0;
    _incrementController.stream.listen(_increment);
    _decrementController.stream.listen(_decrement);
  }

  @override
  void dispose() {
    _counterController.close();
    _incrementController.close();
    _decrementController.close();
  }
}
