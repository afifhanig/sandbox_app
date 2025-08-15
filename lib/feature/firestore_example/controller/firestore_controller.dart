import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sandbox_flutter_3/feature/firestore_example/model/diary_model.dart';

class FirestoreController extends GetxController {
  var diaryList = <DiaryModel>[].obs;
  var allDiaryEntries = <DiaryModel>[].obs;
  var isLoadingFetchingAllData = false.obs;
  var isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await fetchAllDiaryEntries(); // Fetch all diary entries on init
    fetchDiary(DateTime.now()); // Fetch diary for today's date
  }

  CollectionReference<DiaryModel> getDiaryCollection() {
    return FirebaseFirestore.instance.collection("diary").withConverter<DiaryModel>(
          fromFirestore: (snapshots, _) => DiaryModel.fromJson(snapshots.data()!),
          toFirestore: (diary, _) => diary.toJson(),
        );
  }

  // Method to fetch all diary entries (for calendar markers)
  Future<void> fetchAllDiaryEntries() async {
    isLoadingFetchingAllData.value = true;
    CollectionReference<DiaryModel> diary = getDiaryCollection();
    try {
      QuerySnapshot<DiaryModel> snapshot = await diary.get();
      allDiaryEntries.value = snapshot.docs.map((doc) => doc.data()).toList(); // Store all diary entries
    } catch (error) {
      print("Failed to fetch all diary entries: $error");
    } finally {
      isLoadingFetchingAllData.value = false; // Stop loading
    }
  }

  Future<void> fetchDiary(DateTime selectedDate) async {
    isLoading.value = true;
    CollectionReference<DiaryModel> diary = getDiaryCollection();
    DateTime startOfDay = DateTime(selectedDate.year, selectedDate.month, selectedDate.day);
    DateTime endOfDay = startOfDay.add(const Duration(days: 1));
    try {
      QuerySnapshot<DiaryModel> snapshot = await diary.where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(startOfDay)).where('date', isLessThan: Timestamp.fromDate(endOfDay)).get();
      diaryList.value = snapshot.docs.map((doc) => doc.data()).toList();
      if (diaryList.isEmpty) {
        print("No data for the selected date.");
      } else {
        print("Data fetched successfully.");
      }
    } catch (error) {
      print("Failed to fetch diary: $error");
    } finally {
      isLoading.value = false; // Stop loading
    }
  }
}
