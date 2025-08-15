class AllCatalogTrainingModel {
  AllCatalogTrainingModel({
    required this.content,
    required this.empty,
    required this.first,
    required this.last,
    required this.number,
    required this.numberOfElements,
    required this.size,
    required this.sort,
    required this.totalElements,
    required this.totalPages,
  });
  late final List<Content> content;
  late final bool empty;
  late final bool first;
  late final bool last;
  late final int number;
  late final int numberOfElements;
  late final int size;
  late final Sort sort;
  late final int totalElements;
  late final int totalPages;
  
  AllCatalogTrainingModel.fromJson(Map<String, dynamic> json){
    content = List.from(json['content']).map((e)=>Content.fromJson(e)).toList();
    empty = json['empty'];
    first = json['first'];
    last = json['last'];
    number = json['number'];
    numberOfElements = json['numberOfElements'];
    size = json['size'];
    sort = Sort.fromJson(json['sort']);
    totalElements = json['totalElements'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['content'] = content.map((e)=>e.toJson()).toList();
    _data['empty'] = empty;
    _data['first'] = first;
    _data['last'] = last;
    _data['number'] = number;
    _data['numberOfElements'] = numberOfElements;
    _data['size'] = size;
    _data['sort'] = sort.toJson();
    _data['totalElements'] = totalElements;
    _data['totalPages'] = totalPages;
    return _data;
  }
}

class Content {
  Content({
    required this.id,
    required this.location,
    required this.startDate,
    required this.trainingName,
  });
  late final int id;
  late final String location;
  late final String startDate;
  late final String trainingName;
  
  Content.fromJson(Map<String, dynamic> json){
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

class Sort {
  Sort({
    required this.empty,
    required this.sorted,
    required this.unsorted,
  });
  late final bool empty;
  late final bool sorted;
  late final bool unsorted;
  
  Sort.fromJson(Map<String, dynamic> json){
    empty = json['empty'];
    sorted = json['sorted'];
    unsorted = json['unsorted'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['empty'] = empty;
    _data['sorted'] = sorted;
    _data['unsorted'] = unsorted;
    return _data;
  }
}