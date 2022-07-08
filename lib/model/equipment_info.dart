class EquipmentInfo {
  int id;
  String name;
  String type;
  String image;
  int price;

  EquipmentInfo({
    required this.id,
    required this.name,
    required this.type,
    required this.image,
    required this.price,
  });

  factory EquipmentInfo.fromJson(Map<String, dynamic> json) {
    return EquipmentInfo(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      image: json['image'],
      price: json['price'],
    );
  }
}
