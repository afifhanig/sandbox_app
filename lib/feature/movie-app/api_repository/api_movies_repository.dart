import 'package:dio/dio.dart';
import 'package:sandbox_flutter_3/feature/movie-app/constant/app_movies_constant.dart';
import 'package:sandbox_flutter_3/feature/movie-app/model/nowplaying_movies_model.dart';

class ApiMoviesRepository {
  final dio = Dio()
    ..interceptors.add(
      LogInterceptor(
        request: false,
        responseBody: true,
        requestBody: false,
        requestHeader: false,
      ),
    )
    ..options.headers['Authorization'] =
        'Bearer $apiKey'
    ..options.connectTimeout = const Duration(seconds: 4)
    ..options.receiveTimeout = const Duration(seconds: 4);

  Future<String> getToken() async {
    String token = '';
    var url = "https://api.themoviedb.org/3/authentication/token/new";
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        token = response.data['request_token'];
      }
    } catch (e) {
      rethrow;
    }
    return token;
  }

  Future<String> getSession() async {
    String token = '';
    var url = "https://api.themoviedb.org/3/authentication/guest_session/new";
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        token = response.data['guest_session_id'];
      }
    } catch (e) {
      rethrow;
    }
    return token;
  }

  Future<String> getAccountId() async {
    String accountId = '';
    var url = "https://api.themoviedb.org/3/account?api_key=$apiKey&session_id=$sessionApp";
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        accountId = response.data['id'];
      }
    } catch (e) {
      rethrow;
    }
    return accountId;
  }



  Future<List<MoviesModel>> getNowPlayingMovies() async {
    List<MoviesModel> result = [];
    var url = "https://api.themoviedb.org/3/movie/now_playing";
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        var listJson = response.data['results'] as List;
        result = listJson.map((e) => MoviesModel.fromJson(e)).toList();
      }
    } catch (e) {
      rethrow;
    }
    return result;
  }

  Future<List<MoviesModel>> getPopularMovies() async {
    List<MoviesModel> result = [];
    var url = "https://api.themoviedb.org/3/movie/popular";
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        var listJson = response.data['results'] as List;
        result = listJson.map((e) => MoviesModel.fromJson(e)).toList();
      }
    } catch (e) {
      rethrow;
    }
    return result;
  }
}
