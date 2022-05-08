import 'dart:convert';
import 'package:pizzania/models/crust_model.dart';

PizzaModel pizzaModelFromJson(String str) {
  // print("str:    $str");
    final Map<String, dynamic> parsed = json.decode(str);
    final data = PizzaModel.fromJson(parsed);
    // // return List<PizzaModel>.from(data);
    print(data.runtimeType);
    // return List<PizzaModel>.from(json.decode(str).map<String, dynamic>((x) => PizzaModel.fromJson(x)));
  return data;
  }

// String pizzaModelToJson(List<PizzaModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PizzaModel {
  PizzaModel({
    required this.id,
    required this.name,
    required this.isVeg,
    required this.description,
    required this.defaultCrust,
    required this.crusts
  });

  String id;
  String name;
  bool isVeg;
  String description;
  int defaultCrust;
  List<CrustModel> crusts;

  // factory PizzaModel.fromJson(Map<String, dynamic> json) => PizzaModel(
  //   id: json["id"],
  //   name: json["name"],
  //   isVeg: json["isVeg"] ,
  //   description: json["description"],
  //   defaultCrust: json["defaultCrust"],
  //   final crustsData: json["crusts"] as List<dynamic>?
  // );

  factory PizzaModel.fromJson(Map<String, dynamic> json) {
      // id: json["id"],
      // name: json["name"],
      // isVeg: json["isVeg"] ,
      // description: json["description"],
      // defaultCrust: json["defaultCrust"],

      final crustsData = json["crusts"] ;
      print("crustsData: $crustsData");
      // final crusts = crustsData != null ?
      //     crustsData.map<CrustModel>((crustData) => CrustModel.fromJson(crustData)).toList() : <CrustModel>[];
      // List<CrustModel>crusts = crustsData != null ? crustsData.cast<CrustModel>() : <CrustModel>[];
      // List<CrustModel> crusts = <CrustModel>[];

      // crustsData.forEach((crustData){
      //   var crustModel = CrustModel(name: crustData["name"], id: crustData["id"], defaultSize: crustData["defaultSize"], sizes: crustData["sizes"]);
      //   print("crust model: $crustModel");
      //   crusts.add(crustModel);
      // });
      List<CrustModel> crusts = crustsData.map<CrustModel>((crustData) => CrustModel.fromJson(crustData)).toList();


      print("crusts: $crusts");
      return PizzaModel(
        id: json["id"],
        name: json["name"],
        isVeg: json["isVeg"] ,
        description: json["description"],
        defaultCrust: json["defaultCrust"],
        crusts: crusts
      );
  }

  // Map<String, dynamic> toJson() => {
  //   "id": id,
  //   "name": name,
  //   "isVeg": isVeg,
  //   "description": description,
  //   "defaultCrust": defaultCrust,
  //   "crusts": crusts.toJson(),
  // };
}