part of '_index.dart';

final x1MovieServ = MovieServ();

class MovieServ {
  MovieData get dt => x1MovieData.st;

  init() => logxx.i(MovieServ, '...');

  setSelectedId(int id) {
    dt.rxSelectedId.refresh();
    dt.rxSelectedId.setState((s) => id);
  }

  addToList(List<Movie> moreMovies) {
    dt.rxMovieList.setState((s) => [...s, ...moreMovies]);
    if (moreMovies.isEmpty) {
      dt.rxIsEnd.setState((s) => true);
    }
  }

  //* triggered on initstate ----- ----- ----- ----- -----

  Future<dynamic> initMoviesLoader() async {
    await dt.rxIsEnd.refresh();
    await dt.rxSelectedId.refresh();
    await dt.rxMovieList.refresh();

    // logx.s(dt.rxPage.st.toString());
    dt.rxMoviesLoader.stateAsync = dt.rxMoviesLoader.setState((s) => handleMoviesLoader());
  }

  Future<dynamic> nextMoviesLoader() async {
    // logx.s(dt.rxPage.st.toString());
    dt.rxMoviesLoader.stateAsync = dt.rxMoviesLoader.setState((s) => handleMoviesLoader());
  }

  Future<dynamic> handleMoviesLoader() async {
    try {
      final initRxLoadMore = await readMoviesLoader();
      dt.rxMoviesLoader.setToHasData(initRxLoadMore);
    } catch (e) {
      dt.rxMoviesLoader.setToHasError(e);
      return Fun.handleException(e);
    }
  }

  Future<dynamic> readMoviesLoader() async {
    try {
      final movies = await x1MovieRepo.st.readMovies();
      return movies;
    } catch (e) {
      rethrow;
    }
  }

  //* triggered on initstate ----- ----- ----- ----- -----

  initMovieDetail() {
    dt.rxMovieFuture.stateAsync = dt.rxMovieFuture.setState((s) => handleMovieDetail());
  }

  Future<dynamic> handleMovieDetail() async {
    try {
      final movie = await readMovieDetail();
      dt.rxMovieFuture.setToHasData(movie);
      // logx.i(dt.rxMovieFuture.st.toString());
    } catch (e) {
      dt.rxMovieFuture.setToHasError(e);
      return Fun.handleException(e);
    }
  }

  Future<dynamic> readMovieDetail() async {
    try {
      final movie = await x1MovieRepo.st.readMovie();
      return movie;
    } catch (e) {
      rethrow;
    }
  }

  // * --- --- --- ---

  Future<dynamic> initCast() async {
    await dt.rxMovieList.refresh();
    dt.rxMovieFuture.stateAsync = dt.rxMovieFuture.setState((s) => handleCast());
  }

  Future<dynamic> handleCast() async {
    try {
      final movie = await readCast();
      dt.rxMovieFuture.setToHasData(movie);
      // logx.i(dt.rxMovieFuture.st.toString());
    } catch (e) {
      dt.rxMovieFuture.setToHasError(e);
      return Fun.handleException(e);
    }
  }

  Future<dynamic> readCast() async {
    try {
      final cast = await x1MovieRepo.st.readCast();
      return cast;
    } catch (e) {
      rethrow;
    }
  }

  addToListCast(List<Cast> moreCast) {
    dt.rxCastList.setState((s) => [...s, ...moreCast]);
    if (moreCast.isEmpty) {
      dt.rxIsEnd.setState((s) => true);
    }
  }

  //* triggered on initstate ----- ----- ----- ----- -----

  Future<dynamic> initCastLoader() async {
    await dt.rxIsEnd.refresh();
    // await dt.rxSelectedId.refresh();
    await dt.rxCastList.refresh();

    // logx.i(dt.rxCastList.st.toString());
    // logx.i(dt.rxCastLoader.st.toString());

    // print(dt.rxCastList.st);
    // print(dt.rxCastLoader.st);

    // logx.s(dt.rxPage.st.toString());
    dt.rxMoviesLoader.stateAsync = dt.rxMoviesLoader.setState((s) => handleCastLoader());
  }

  Future<dynamic> nextCastLoader() async {
    // logx.s(dt.rxPage.st.toString());
    dt.rxCastLoader.stateAsync = dt.rxCastLoader.setState((s) => handleCastLoader());
  }

  Future<dynamic> handleCastLoader() async {
    try {
      final initRxLoadMore = await readCastLoader();
      dt.rxCastLoader.setToHasData(initRxLoadMore);
    } catch (e) {
      dt.rxMoviesLoader.setToHasError(e);
      return Fun.handleException(e);
    }
  }

  Future<dynamic> readCastLoader() async {
    try {
      final movies = await x1MovieRepo.st.readCast();
      return movies;
    } catch (e) {
      rethrow;
    }
  }
}
