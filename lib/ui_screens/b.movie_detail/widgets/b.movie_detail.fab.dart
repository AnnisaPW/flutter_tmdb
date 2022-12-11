part of '../_index.dart';

class MovieDetailFab extends StatelessWidget {
  const MovieDetailFab({Key? key}) : super(key: key);

  MovieDetailCtrl get ct => x1MovieDetailCtrl;
  MovieDetailData get dt => x1MovieDetailData.st;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () => ct.action(),
    );
  }
}
