import 'package:flutter/material.dart';
import 'package:foodoptima/models/checkbox_state.dart';

class RequirementsList extends StatefulWidget {
  const RequirementsList({super.key});

  @override
  State<RequirementsList> createState() => _RequirementsListState();
}

class _RequirementsListState extends State<RequirementsList> {
  final requirements = [
    RequirementItemState(title: "Buenas 1"),
    RequirementItemState(title: "Buenas 2"),
    RequirementItemState(title: "Buenas 3"),
    RequirementItemState(title: "Buenas 4"),
    RequirementItemState(title: "Buenas 5"),
  ];

  Widget RequirementItem(RequirementItemState state) => Card(
        child: CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            value: state.value,
            title: Text(
              state.title,
              style: const TextStyle(fontSize: 15, color: Colors.black),
            ),
            onChanged: (value) => setState(() => state.value = value!)),
      );

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [...requirements.map(RequirementItem)],
    );
  }
}
