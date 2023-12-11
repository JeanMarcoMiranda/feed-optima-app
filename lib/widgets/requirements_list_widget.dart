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

  Widget RequirementItem2(RequirementItemState state) => Card(
        child: ExpansionTile(
          title: Row(
            children: [
              Checkbox(
                  value: state.value,
                  onChanged: (value) => setState(() => state.value = value!)),
              Text(state.title)
            ],
          ),
          children: [
            SizedBox(
              width: double.infinity,
              height: 120,
              child: GridView.builder(
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 10,
                        width: 10,
                        child: Card(
                          elevation: 5,
                          color: Colors.brown[200],
                          child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'E. MATAB.',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                                Text(
                                  '6.0802',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                      color: Colors.white),
                                )
                              ]),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [...requirements.map(RequirementItem2)],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 7.0, right: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/food_list_screen');
                },
                child: const Text('Siguiente'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
