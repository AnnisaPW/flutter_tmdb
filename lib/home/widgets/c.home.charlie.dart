part of '../_index.dart';

class HomeCharlie extends StatelessWidget {
  const HomeCharlie({Key? key}) : super(key: key);

  HomeCtrl get ct => x1HomeCtrl;
  HomeData get dt => x1HomeData.st;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(Random().nextInt(100).toString()),
        OnReactive(() => Text('${dt.rxInt.st}')),
      ],
    );
  }
}
