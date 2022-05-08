class SizeModel{
  SizeModel({
    required this.id,
    required this.name,
    required this.price
});
  int id;
  String name;
  int price;

  factory SizeModel.fromJson(Map<String, dynamic> json) => SizeModel(
    id: json["id"],
    name: json["name"],
    price: json["price"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price
  };
}