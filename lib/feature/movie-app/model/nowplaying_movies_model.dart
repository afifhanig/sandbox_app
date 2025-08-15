class MoviesModel {
  MoviesModel({
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
  });
  late final int id;
  late final String overview;
  late final String posterPath;
  late final String releaseDate;
  late final String title;
  late final double voteAverage;
  
  MoviesModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    voteAverage = json['vote_average'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['overview'] = overview;
    _data['poster_path'] = posterPath;
    _data['release_date'] = releaseDate;
    _data['title'] = title;
    _data['vote_average'] = voteAverage;
    return _data;
  }
}