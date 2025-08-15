import 'package:get/get.dart';
import 'package:sandbox_flutter_3/feature/movie-app/api_repository/api_movies_repository.dart';
import 'package:sandbox_flutter_3/feature/movie-app/constant/app_movies_constant.dart';
import 'package:sandbox_flutter_3/feature/movie-app/screen/dashboard_movie.dart';

class AuthenticationController extends GetxController {
  var successGetToken = false.obs;
  var successGetSession = false.obs;
  var successGetAccountId = false.obs;

  @override
  void onInit() async {
    await getToken();
    // await getSession();
    // await getAccountId();
    super.onInit();
  }

//   Future<void> authenticateUser() async {
//   String? sessionId = await getSessionId();
//   if (sessionId == null) {
//     try {
//       String requestToken = await createRequestToken();
//       // Ask user to authenticate by visiting the URL: 'https://www.themoviedb.org/authenticate/$requestToken'
//       // Once the user authenticates, create a session
//       sessionId = await createSession(requestToken);
//       await saveSessionId(sessionId);
//       accountId = await getAccountId(sessionId);
//     } catch (e) {
//       print('Error during authentication: $e');
//     }
//   } else {
//     try {
//       accountId = await getAccountId(sessionId);
//     } catch (e) {
//       print('Error getting account ID: $e');
//     }
//   }
// }

  getToken() async {
    try {
      var response = await ApiMoviesRepository().getToken();
      tokepApp = response;
      successGetToken.value = true;
      print(tokepApp);
      validateSuccess();
    } catch (e) {
      print(e);
    }
  }

  getSession() async {
    try {
      var response = await ApiMoviesRepository().getSession();
      sessionApp = response;
      successGetSession.value = true;
      validateSuccess();
    } catch (e) {
      print(e);
    }
  }

  getAccountId() async{
    try{
      var response = await ApiMoviesRepository().getAccountId();
      accountId = response;
      successGetAccountId.value = true;
      validateSuccess();
      print('your account id : $accountId');
    }catch(e){
      print(e);
    }
  }

  validateSuccess() {
    // if (successGetToken.value && successGetSession.value) {
    //   Get.off(DashboardMovies());
    // } else {
    //   print('Failed');
    // }
  }
}
