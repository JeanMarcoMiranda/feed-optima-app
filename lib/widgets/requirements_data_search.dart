import 'package:flutter/material.dart';
import 'package:foodoptima/models/requirement_model.dart';
import 'package:go_router/go_router.dart';

class RequirementsDataSearch<T> extends SearchDelegate<T> {
  final List<T> requerimientos;

  RequirementsDataSearch(this.requerimientos);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        context.pop();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results =
        requerimientos.where((requerimiento) => _matchesQuery(requerimiento));

    return ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          final req = results.elementAt(index);
          return ListTile(
            title: _requirementTitle(req),
            onTap: () {
              close(context, req);
            },
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final results =
        requerimientos.where((requerimiento) => _matchesQuery(requerimiento));

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final req = results.elementAt(index);
        return ListTile(
          title: _requirementTitle(req),
          onTap: () {
            close(context, req);
          },
        );
      },
    );
  }

  bool _matchesQuery(T requirement) {
    if (requirement is BullRequirementsModel) {
      return requirement.peso_vivo!.toLowerCase().contains(query.toLowerCase());
    } else if (requirement is CowRequirementsModel) {
      return requirement.peso_vivo!.toLowerCase().contains(query.toLowerCase());
    } else {
      throw UnimplementedError('Unexpected type for _matchQuery');
    }
  }

  Widget _requirementTitle(T requirement) {
    if (requirement is BullRequirementsModel) {
      final title = requirement.peso_vivo;
      return Text(title!);
    } else if (requirement is CowRequirementsModel) {
      final title = requirement.peso_vivo;
      return Text(title!);
    } else {
      throw UnimplementedError('Unexpected type for _matchQuery');
    }
  }
}
