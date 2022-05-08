import 'package:http/http.dart' as http;
import 'package:pizzania/models/pizza_model.dart';
import 'package:pizzania/constants.dart';

class ApiService {
  Future<List<PizzaModel>?> getPizzas() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.pizzasEndpoint);
      var response = await http.get(url);
      print(response.statusCode);
      if (response.statusCode == 200) {
        // print(response.body);
        PizzaModel _model = pizzaModelFromJson(response.body);
        // print(_model);
        List<PizzaModel> pizzas = [];
        pizzas.add(_model);
        return pizzas;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
