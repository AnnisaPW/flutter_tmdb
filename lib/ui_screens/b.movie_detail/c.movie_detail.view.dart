part of '_index.dart';

class MovieDetailView extends StatelessWidget {
  const MovieDetailView({Key? key}) : super(key: key);

  MovieDetailCtrl get ct => x1MovieDetailCtrl;
  MovieDetailData get dt => x1MovieDetailData.st;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: MovieDetailAppbar(),
      ),
      body: OnBuilder<DetailsMovie?>.all(
        listenTo: dt.rxMovieFuture,
        onWaiting: () => const Center(child: CircularProgressIndicator()),
        onError: (e, s) => const Text('error'),
        onData: (data) {
          return data == null
              ? const Text('null')
              : Stack(
                  children: const [
                    MovieDetailBackDrop(),
                    MovieDetailContent(),
                  ],
                );
        },
      ),
    );
  }
}
