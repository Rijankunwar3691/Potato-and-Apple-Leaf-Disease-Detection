
int highText = 0xFFD50000;
int highTemp = 0xFFD32F2F;
int moderateText = 0xFFffC400;
int moderateTemp = 0xFFFF9800;
int normalText = 0xFF69F0AE;
int normalTemp = 0xFF66BB6A;
int lightBlueHumidity = 0xFF2196F3;
int darkBlueMoisture = 0xFF3F51B5;

class ApiDataModel {
  Channel? channel;
  List<Feeds>? feeds;

  ApiDataModel({channel, feeds});

  ApiDataModel.fromJson(Map<String, dynamic> json) {
    channel =
        json['channel'] != null ?  Channel.fromJson(json['channel']) : null;
    if (json['feeds'] != null) {
      feeds = <Feeds>[];
      json['feeds'].forEach((v) {
        feeds!.add( Feeds.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  {};
    if (channel != null) {
      data['channel'] = channel!.toJson();
    }
    if (feeds != null) {
      data['feeds'] = feeds!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Channel {
  int? id;
  String? name;
  String? description;
  String? latitude;
  String? longitude;
  String? field1;
  String? field2;
  String? field3;
  String? createdAt;
  String? updatedAt;
  int? lastEntryId;

  Channel(
      {id,
      name,
      description,
      latitude,
      longitude,
      field1,
      field2,
      field3,
      createdAt,
      updatedAt,
      lastEntryId});

  Channel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    field1 = json['field1'];
    field2 = json['field2'];
    field3 = json['field3'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    lastEntryId = json['last_entry_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['field1'] = field1;
    data['field2'] = field2;
    data['field3'] = field3;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['last_entry_id'] = lastEntryId;
    return data;
  }
}

class Feeds {
  String? createdAt;
  int? entryId;
  String? field1;
  String? field2;
  String? field3;

  Feeds({createdAt, entryId, field1, field2, field3});

  Feeds.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    entryId = json['entry_id'];
    field1 = json['field1'];
    field2 = json['field2'];
    field3 = json['field3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['created_at'] = createdAt;
    data['entry_id'] = entryId;
    data['field1'] = field1;
    data['field2'] = field2;
    data['field3'] = field3;
    return data;
  }
}
class Conditions {
  var icon;
  var name;
  var value;
  var subText;
  var color;
  var subColor;
  Conditions(
      {icon,
      name,
      value,
      subText,
      color,
      subColor});
}
