import 'dart:async';

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
  final _eventStreamController = StreamController<int>();

  StreamSink<int> get eventSink => _eventStreamController.sink;
  Stream<int> get eventStream => _eventStreamController.stream;
}
