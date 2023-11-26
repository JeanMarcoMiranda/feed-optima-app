import 'package:flutter/material.dart';
import 'package:foodoptima/widgets/requirements_list_widget.dart';

class RequirementsScreen extends StatelessWidget {
  const RequirementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[400],
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
            'Requerimientos',
            style: TextStyle(color: Colors.white),
          )),
        ),
        body: const RequirementsList());
  }
}
