class AllAvailableDeskResponse {
  AllAvailableDeskResponse({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });
  late final int code;
  late final String status;
  late final String message;
  late final Data data;
  
  AllAvailableDeskResponse.fromJson(Map<String, dynamic> json){
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.officeName,
    required this.floor,
    required this.status,
    required this.layout,
    required this.layoutContentType,
    required this.layoutName,
    required this.totalDesk,
    required this.deskListDto,
  });
  late final int id;
  late final String officeName;
  late final String floor;
  late final String status;
  late final String layout;
  late final String layoutContentType;
  late final String layoutName;
  late final int totalDesk;
  late final List<DeskListDto> deskListDto;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    officeName = json['officeName'];
    floor = json['floor'];
    status = json['status'];
    layout = json['layout'];
    layoutContentType = json['layoutContentType'];
    layoutName = json['layoutName'];
    totalDesk = json['totalDesk'];
    deskListDto = List.from(json['deskListDto']).map((e)=>DeskListDto.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['officeName'] = officeName;
    _data['floor'] = floor;
    _data['status'] = status;
    _data['layout'] = layout;
    _data['layoutContentType'] = layoutContentType;
    _data['layoutName'] = layoutName;
    _data['totalDesk'] = totalDesk;
    _data['deskListDto'] = deskListDto.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class DeskListDto {
  DeskListDto({
    required this.id,
    required this.number,
    required this.status,
    required this.coordinate0,
    required this.coordinate1,
    required this.coordinate2,
    required this.coordinate3,
  });
  late final int id;
  late final String number;
  late final String status;
  late final String coordinate0;
  late final String coordinate1;
  late final String coordinate2;
  late final String coordinate3;
  
  DeskListDto.fromJson(Map<String, dynamic> json){
    id = json['id'];
    number = json['number'];
    status = json['status'];
    coordinate0 = json['coordinate0'];
    coordinate1 = json['coordinate1'];
    coordinate2 = json['coordinate2'];
    coordinate3 = json['coordinate3'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['number'] = number;
    _data['status'] = status;
    _data['coordinate0'] = coordinate0;
    _data['coordinate1'] = coordinate1;
    _data['coordinate2'] = coordinate2;
    _data['coordinate3'] = coordinate3;
    return _data;
  }
}