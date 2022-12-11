part of '_index.dart';

final x1MovieListCtrl = MovieListCtrl();

class MovieListCtrl {
  MovieListData get dt => x1MovieListData.st;

  init() => logxx.i(MovieListCtrl, '...');

  Future<void> refresh() async {
    await x1MovieServ.initMoviesLoader();
  }

  Future<void> loadMore() async {
    // dt.isLoading.st = true;
    // await Future.delayed(const Duration(seconds: 2));
    await x1MovieServ.nextMoviesLoader();
    // dt.isLoading.st = false;
  }

  select(int id) {
    x1MovieServ.setSelectedId(id);
    nav.to(Routes.movieDetail);
  }

  // isLoading() async {
  //   dt.isLoading.st = true;
  //   await Future.delayed(const Duration(seconds: 2));
  //   dt.isLoading.st = false;
  // }
}
