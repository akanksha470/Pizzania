import 'package:flutter/material.dart';
import 'package:pizzania/models/pizza_model.dart';
import 'package:pizzania/service/api_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<PizzaModel>? _pizzaModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _pizzaModel = (await ApiService().getPizzas())!;
    print(_pizzaModel);
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: _pizzaModel == null || _pizzaModel!.isEmpty
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: _pizzaModel != null ? _pizzaModel!.length : 0,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(_pizzaModel![index].id.toString()),
                    Text(_pizzaModel![index].name),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(_pizzaModel![index].isVeg.toString()),
                    Text(_pizzaModel![index].description),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}