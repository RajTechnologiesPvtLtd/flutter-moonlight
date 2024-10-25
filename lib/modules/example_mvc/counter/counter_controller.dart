import 'counter_model.dart';

class CounterController {
  CounterModel model = CounterModel();

  int get count => model.count;

  void increment() {
    model.increment();
  }

  void decrement() {
    model.decrement();
  }
}
