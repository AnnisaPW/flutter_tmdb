part of '_index.dart';

final x1MovieDetailData = RM.inject<MovieDetailData>(
  () => MovieDetailData(),
  debugPrintWhenNotifiedPreMessage: '',
  sideEffects: SideEffects(initState: () => x1MovieDetailCtrl.init()),
);

class MovieDetailData {
  final rxTitle = 'MovieDetail'.inj();

  final rxInt = 0.inj();

  final rxIsEnd = x1MovieData.st.rxIsEnd;

  final rxMovieFuture = x1MovieData.st.rxMovieFuture;

  final rxCastList = x1MovieData.st.rxCastList;
  final rxCastLoader = x1MovieData.st.rxCastLoader;
}
