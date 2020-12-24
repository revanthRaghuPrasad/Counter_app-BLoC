import 'dart:async';

enum CounterAction {
  Increment,
  Decrement,
  Reset,
}

class CounterBloc {
  // contoller
  // stateStreamController
  final _stateStreamController = StreamController<int>();

  /* remember the getter and the fat arrow */
  // sink of type StreamSink as input
  StreamSink<int> get counterSink => _stateStreamController.sink;
  // stream of type Stream as output
  Stream<int> get counterStream => _stateStreamController.stream;

  // eventStreamContoller
  // creating new pipe
  final _eventStreamController = StreamController<CounterAction>();

  StreamSink<CounterAction> get eventSink => _eventStreamController.sink;
  Stream<CounterAction> get eventStream => _eventStreamController.stream;

  CounterBloc() {
    int counter = 0;
    eventStream.listen((event) {
      if (event == CounterAction.Increment)
        return counter++;
      else if (event == CounterAction.Decrement)
        return counter--;
      else if (event == CounterAction.Reset) return counter = 0;

      counterSink.add(counter);
    });
  }
}
