import 'package:flutter/material.dart';
import 'package:foodoptima/models/food_state.dart';

class DataSearch extends SearchDelegate<Alimento> {
  final List<Alimento> alimentos;

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
        close(context, [] as Alimento);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = alimentos
        .where((alimento) =>
            alimento.nombre.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index].nombre),
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
            alimento.nombre.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index].nombre),
          onTap: () {
            close(context, results[index]);
          },
        );
      },
    );
  }
}
