import 'package:mocktail/mocktail.dart';

class Dumb {
  void call() {}
  void callWithParam1(param) {
    
  }
}

class MockDumb extends Mock implements Dumb {}
