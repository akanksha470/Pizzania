import 'package:pizzania/models/size_model.dart';

class CrustModel {
  CrustModel({
    required this.id,
    required this.name,
    required this.defaultSize,
    required this.sizes
  });

  int id;
  String name;
  int defaultSize;
  List<SizeModel> sizes;

  factory CrustModel.fromJson(Map<String, dynamic> json){
    // id: json["id"],
    // name: json["name"],
    // defaultSize: json["defaultSize"],
    // sizes: SizeModel.fromJson(json["sizes"])
    // );
    final sizesData = json["sizes"];
    print("SizesData : ${sizesData}");
    // List<SizeModel> sizes = <SizeModel>[];

    // sizesData.forEach((sizeData) {
    //   var sizeModel = SizeModel(name: sizeData["name"],
    //       id: sizeData["id"],
    //     price: sizeData["price"]
    //      );
    //   // print("size model: $sizeModel");
    //   sizes.add(sizeModel);
    // });
    List<SizeModel>sizes = sizesData.map<SizeModel>((sizeData) => SizeModel.fromJson(sizeData)).toList();
    print("sizes: $sizes");
    return CrustModel(
        id: json["id"],
        name: json["name"],
        defaultSize: json["defaultSize"],
        sizes: sizes
    );
  }



  // Map<String, dynamic> toJson() => {
  //   "id": id,
  //   "name": name,
  //   "defaultSize": defaultSize,
  //   "sizes": sizes.toJson()
  // };
}