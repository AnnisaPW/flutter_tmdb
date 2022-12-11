part of '../_index.dart';

class MovieDetailContent extends StatelessWidget {
  const MovieDetailContent({Key? key}) : super(key: key);

  MovieDetailCtrl get ct => x1MovieDetailCtrl;
  MovieDetailData get dt => x1MovieDetailData.st;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(5, 8, 5, 8),
        children: [
          MovieDetailPercent(movie: dt.rxMovieFuture.st),
          const SizedBox(height: 100),

          OnReactive(() => MovieDetailLabel(
                detail: dt.rxMovieFuture.st,
              )),
          MovieDetailOverview(
            detailMovie: dt.rxMovieFuture.st,
          ),
          const SizedBox(height: 10),
          Row(
            children: const [
              SizedBox(
                width: 5,
              ),
              Text(
                'Top Billed Cast',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const MovieDetailCastView(),
          // const DetailMovieRecommendation()
        ],
      ),
    );
  }
}
