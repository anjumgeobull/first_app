class GetApiData {
  GetApiData({
    required this.status,
    required this.data,
  });
  late final int status;
  late final List<Data> data;

  GetApiData.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.updatedAt,
    required this.createdAt,
  });
  late final String id;
  late final String name;
  late final String updatedAt;
  late final String createdAt;

  Data.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    name = json['name'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    return _data;
  }
}