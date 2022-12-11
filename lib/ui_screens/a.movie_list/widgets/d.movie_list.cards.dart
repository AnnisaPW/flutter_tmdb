part of '../_index.dart';

class MovieListCards extends StatelessWidget {
  const MovieListCards({Key? key}) : super(key: key);

  MovieListCtrl get ct => x1MovieListCtrl;
  MovieListData get dt => x1MovieListData.st;

  @override
  Widget build(BuildContext context) {
    return Child2(
      child1: const MovieListPullText(),
      child2: const MovieListLoadMore(),
      builder: (child1, child2) {
        return RefreshIndicator(
          onRefresh: () => ct.refresh(),
          child: OnBuilder.data(
            listenToMany: [dt.rxMovieList, dt.rxMovieLoader],
            builder: (_) => ListView(
              padding: const EdgeInsets.all(2),
              children: [
                child1,
                for (var item in dt.rxMovieList.st) MovieListCard(movie: item),
                child2,
              ],
            ),
          ),
        );
      },
    );
  }
}
