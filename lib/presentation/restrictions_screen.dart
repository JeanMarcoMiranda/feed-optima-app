import 'package:flutter/material.dart';
import 'package:foodoptima/models/restriction_state.dart';
import 'package:foodoptima/models/route_names.dart';
import 'package:go_router/go_router.dart';

class RestrictionsScreen extends StatefulWidget {
  const RestrictionsScreen({super.key});

  @override
  State<RestrictionsScreen> createState() => _RestrictionsScreenState();
}

class _RestrictionsScreenState extends State<RestrictionsScreen> {
  final restrictions = [
    Restriccion(
        alimento: "Aceites",
        restriccionPor: "2-4% M.S, Baja fermentacion ruminal"),
    Restriccion(
        alimento: "Brote de Malta",
        restriccionPor: "10% M.S. disminuye palatabilidad"),
    Restriccion(
        alimento: "Concentrados", restriccionPor: "50% M.S. acidosis ruminal"),
    Restriccion(alimento: "Coronta de Maiz", restriccionPor: "Maximo, 20%"),
    Restriccion(
        alimento: "Ensilajes",
        restriccionPor: "30 - 35% M.S. acidosis ruminal"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Center(
            child: Text(
          'Restrictions screen',
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Alimentos",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: [...restrictions.map(restrictionsListItem)],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black45,
        selectedItemColor: Colors.black45,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.arrow_back,
              ),
              label: "Regresar"),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.arrow_forward,
            ),
            label: "Siguiente",
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            context.pop();
          } else if (index == 1) {
            context.pushNamed(RouteNames.summaryFood);
          }
        },
      ),
    );
  }

  Widget restrictionsListItem(Restriccion state) => CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          state.alimento,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(state.restriccionPor),
        value: state.isSelected,
        onChanged: (value) {
          setState(() => state.isSelected = value!);
        },
      );
}
