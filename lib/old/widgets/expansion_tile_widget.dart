import 'package:flutter/material.dart';

class CustomExpansionTile extends StatefulWidget {
  final String title;
  final String subTitle;

  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _isExpanded = false;
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Checkbox(
        value: _isChecked,
        onChanged: (value) {
          setState(() {
            _isChecked = value!;
          });
        },
      ),
      title: Text(
        widget.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(widget.subTitle),
      onExpansionChanged: (bool expanded) {
        setState(() {
          _isExpanded = expanded;
        });
      },
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Wrap(
            children: [
              Card(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Haba fresca'),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Aceite de Soya'),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Alfalfa heno'),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Alfalfa Ensalinada'),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Avena paja'),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Avena Fresca'),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Carbonato de Calcio'),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
