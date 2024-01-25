import 'package:flutter/material.dart';
import 'package:foodoptima/db/dao/food_list_dao.dart';
import 'package:foodoptima/models/food_list_model.dart';
import 'package:foodoptima/models/previous_list_state.dart';
import 'package:foodoptima/widgets/appbar_widget.dart';

class PreviousListsScreen extends StatefulWidget {
  const PreviousListsScreen({super.key});

  @override
  State<PreviousListsScreen> createState() => _PreviousListsScreenState();
}

class _PreviousListsScreenState extends State<PreviousListsScreen> {
  List<FoodListModel> _prevLists = [];

  // final _prevLists = [
  //   PreviousListItemState(
  //       fecha: "10/20/24", nombre: "Lista de verano", tipo: "Lista de vacas"),
  //   PreviousListItemState(
  //       fecha: "10/20/24", nombre: "Lista de invierno", tipo: "Lista de vacas"),
  //   PreviousListItemState(
  //       fecha: "10/20/24", nombre: "Lista de otoño", tipo: "Lista de vacas"),
  // ];

  @override
  void initState() {
    super.initState();
    _getFood();
  }

  Future<void> _getFood() async {
    final foodListDao = FoodListDao();
    try {
      _prevLists = await foodListDao.getAll();
      setState(() {}); // Update the UI
    } catch (error) {
      // Handle database errors
      print('Error fetching foods: $error');
      // Show an error message to the user
    }
  }

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
        ),
      ),
    );
  }

  Widget listItem(FoodListModel state) => Card(
        child: ListTile(
          title: Text(
            state.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          // subtitle: Text("${state.tipo} - ${state.fecha}"),
          onTap: () {},
        ),
      );
}
