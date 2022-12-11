part of '_index.dart';

final x1HomeCtrl = HomeCtrl();

class HomeCtrl {
  HomeData get dt => x1HomeData.st;

  init() => logxx.i(HomeCtrl, '...');

  action() => dt.rxInt.setState((s) => s + 1);
}
