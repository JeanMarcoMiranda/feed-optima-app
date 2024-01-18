import 'package:flutter/material.dart';
import 'package:foodoptima/models/previous_list_state.dart';
import 'package:foodoptima/widgets/appbar_widget.dart';

class PreviousListsScreen extends StatefulWidget {
  const PreviousListsScreen({super.key});

  @override
  State<PreviousListsScreen> createState() => _PreviousListsScreenState();
}

class _PreviousListsScreenState extends State<PreviousListsScreen> {
  final _prevLists = [
    PreviousListItemState(
        fecha: "10/20/24", nombre: "Lista de verano", tipo: "Lista de vacas"),
    PreviousListItemState(
        fecha: "10/20/24", nombre: "Lista de invierno", tipo: "Lista de vacas"),
    PreviousListItemState(
        fecha: "10/20/24", nombre: "Lista de otoño", tipo: "Lista de vacas"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[50],
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(children: [
            const CustomAppBar(
              title: 'Listas Previas',
              fontSize: 25,
              activeGoBack: true,
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView(
                children: [..._prevLists.map(listItem)],
              ),
            )
          ]),
        )));
  }

  Widget listItem(PreviousListItemState state) => Card(
        child: ListTile(
          title: Text(
            state.nombre,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          subtitle: Text("${state.tipo} - ${state.fecha}"),
          onTap: () {},
        ),
      );
}
