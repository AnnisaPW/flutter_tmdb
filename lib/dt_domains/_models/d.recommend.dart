part of '_index.dart';

class Recommend {
  int id;
  String originalTitle;
  String title;
  double voteAverage;
  String backdropPath;
  Recommend({
    this.id = 0,
    this.originalTitle = '',
    this.title = '',
    this.voteAverage = 0.0,
    this.backdropPath = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'original_title': originalTitle,
      'title': title,
      'vote_average': voteAverage,
      'backdrop_path': backdropPath,
    };
  }

  factory Recommend.fromMap(Map<String, dynamic> map) {
    return Recommend(
      id: map['id']?.toInt() ?? 0,
      originalTitle: map['original_title'] ?? '',
      title: map['title'] ?? '',
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      backdropPath: map['backdrop_path'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Recommend.fromJson(String source) => Recommend.fromMap(json.decode(source));
}
