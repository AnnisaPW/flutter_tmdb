part of '_index.dart';

final x1HomeData = RM.inject<HomeData>(
  () => HomeData(),
  debugPrintWhenNotifiedPreMessage: '',
  sideEffects: SideEffects(initState: () => x1HomeCtrl.init()),
);

class HomeData {
  final rxTitle = 'Home'.inj();

  final rxInt = 0.inj();
}
