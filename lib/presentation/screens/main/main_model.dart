import 'dart:convert';

MainModel dataFromJson(String str) => MainModel.fromJson(json.decode(str));

String dataToJson(MainModel data) => json.encode(data.toJson());

class MainModel {
  MainModel({
    required this.items,
  });

  late final List<Items> items;

  MainModel.fromJson(Map<String, dynamic> json) {
    items = List.from(json['items']).map((e) => Items.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() => {
        'items': List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Items {
  Items({
    required this.id,
    required this.name,
    this.isFavorite,
  });
  late final String id;
  late final String name;
  bool? isFavorite;

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'];
    isFavorite = json['is_favorite'] ?? false;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "is_favorite": isFavorite,
      };
}
