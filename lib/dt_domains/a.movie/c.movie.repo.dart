part of '_index.dart';

final x1MovieRepo = RM.inject(() => MovieRepo(), debugPrintWhenNotifiedPreMessage: '');

class MovieRepo {
  MovieData get dt => x1MovieData.st;
  Future<List<Movie>?> readMovies() async {
    try {
      List<Movie> movieList = [];
      final res = await x1HttpDio.get(ReqX(path: '/3/movie/popular?api_key=${dt.key}'));
      for (var i in res.data['results']) {
        movieList.add(Movie.fromMap(i));
      }
      return movieList;
    } catch (e) {
      logx.e('this is from read movies');
      rethrow;
    }
  }

  Future<DetailsMovie> readMovie() async {
    try {
      final id = dt.rxSelectedId.st;
      final res = await x1HttpDio.get(ReqX(path: '/3/movie/$id?api_key=${dt.key}&${dt.lang}'));
      return DetailsMovie.fromMap(res.data);
    } catch (e) {
      logx.e('this is from read movie');

      rethrow;
    }
  }

  Future<List<Cast>?> readCast() async {
    try {
      List<Cast> cast = [];
      final id = dt.rxSelectedId.st;
      final res = await x1HttpDio.get(ReqX(path: '/3/movie/$id/credits?api_key=${dt.key}&${dt.lang}'));
      for (var i in res.data['cast']) {
        final x = Cast.fromMap(i);
        cast.add(x);
      }
      return cast;
    } catch (e) {
      logx.e('this is from read movie');

      rethrow;
    }
  }
}
