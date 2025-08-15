import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandbox_flutter_3/feature/movie-app/api_repository/api_movies_repository.dart';
import 'package:sandbox_flutter_3/feature/movie-app/constant/app_movies_constant.dart';
import 'package:sandbox_flutter_3/feature/movie-app/model/nowplaying_movies_model.dart';

class MoviesController extends GetxController {
  var isLoading = false.obs;
  var nowPlayingMoviesList = <MoviesModel>[].obs;
  var popularMoviesList = <MoviesModel>[].obs;

  @override
  void onInit() {
    getNowPlayingMovies();
    getPopularMovies();
    print('mas gan $tokepApp $sessionApp');
    
    super.onInit();
  }

  Future<void> getNowPlayingMovies() async {
    isLoading.value = true;
    try {
      var result = await ApiMoviesRepository().getNowPlayingMovies();
      if(result.isNotEmpty){
        isLoading.value = false;
        nowPlayingMoviesList.assignAll(result);
      }
    } catch (e) {
      isLoading.value = false;
      showErrorDialog();
    }
  }

   Future<void> getPopularMovies() async {
    isLoading.value = true;
    try {
      var result = await ApiMoviesRepository().getPopularMovies();
      if(result.isNotEmpty){
        isLoading.value = false;
        popularMoviesList.assignAll(result);
        print(popularMoviesList.length);
      }
    } catch (e) {
      isLoading.value = false;
      showErrorDialog();
    }
  }

  Future<void> addFavoriteMovies() async{
    isLoading.value = true;
    try{
      
    }catch(e){
      isLoading.value = false;
      showErrorDialog();
    }
  }

  showErrorDialog() {
    Get.dialog(
      const AlertDialog(
        icon: Icon(
          Icons.close_rounded,
          color: Colors.red,
        ),
        title: Text('Error'),
      ),
    );
    Future.delayed(const Duration(seconds: 2), () {
      Get.back();
    });
  }
}
