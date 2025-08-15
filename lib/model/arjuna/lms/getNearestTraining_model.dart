class NearestTraining {
  NearestTraining({
    required this.id,
    required this.location,
    required this.startDate,
    required this.trainingName,
  });
  late final int id;
  late final String location;
  late final String startDate;
  late final String trainingName;
  
  NearestTraining.fromJson(Map<String, dynamic> json){
    id = json['id'];
    location = json['location'];
    startDate = json['startDate'];
    trainingName = json['trainingName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['location'] = location;
    _data['startDate'] = startDate;
    _data['trainingName'] = trainingName;
    return _data;
  }
}