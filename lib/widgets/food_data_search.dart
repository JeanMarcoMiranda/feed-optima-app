import 'package:flutter/material.dart';
import 'package:foodoptima/models/food_model.dart';

class DataSearch extends SearchDelegate<FoodModel> {
  final List<FoodModel> alimentos;

  DataSearch(this.alimentos);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context); // Cierra usando Navigator.pop()
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = alimentos
        .where((alimento) =>
            alimento.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index].name),
          onTap: () {
            close(context, results[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final results = alimentos
        .where((alimento) =>
            alimento.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index].name),
          onTap: () {
            close(context, results[index]);
          },
        );
      },
    );
  }
}
