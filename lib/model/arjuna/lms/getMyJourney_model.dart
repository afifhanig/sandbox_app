class GetMyJourneyModel {
  GetMyJourneyModel({
    required this.completed,
    required this.notComplete,
    required this.onSchedule,
  });
  late final int completed;
  late final int notComplete;
  late final int onSchedule;
  
  GetMyJourneyModel.fromJson(Map<String, dynamic> json){
    completed = json['completed'];
    notComplete = json['notComplete'];
    onSchedule = json['onSchedule'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['completed'] = completed;
    _data['notComplete'] = notComplete;
    _data['onSchedule'] = onSchedule;
    return _data;
  }
}