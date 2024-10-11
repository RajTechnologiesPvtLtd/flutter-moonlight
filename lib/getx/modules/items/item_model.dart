class Item {
  final int? id;
  final String title;
  final String description;
  final String? createdAt;

  Item({
    this.id,
    required this.title,
    required this.description,
    this.createdAt,
  });
}

class ItemModel extends Item {
  ItemModel({
    super.id,
    required super.title,
    required super.description,
    super.createdAt,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'createdAt': createdAt,
    };
  }
}
