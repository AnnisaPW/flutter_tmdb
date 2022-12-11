part of '_index.dart';

final x1MovieListData = RM.inject<MovieListData>(
  () => MovieListData(),
  debugPrintWhenNotifiedPreMessage: '',
  sideEffects: SideEffects(initState: () => x1MovieListCtrl.init()),
);

class MovieListData {
  final rxTitle = 'Movie List'.inj();

  final rxIsEnd = x1MovieData.st.rxIsEnd;

  final rxSelectedId = x1MovieData.st.rxSelectedId;

  final rxMovieList = x1MovieData.st.rxMovieList;

  final rxMovieLoader = x1MovieData.st.rxMoviesLoader;

  final isLoading = false.inj();
}
