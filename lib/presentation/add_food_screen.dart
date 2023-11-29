import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddFoodScreen extends StatefulWidget {
  const AddFoodScreen({super.key});

  @override
  State<AddFoodScreen> createState() => _AddFoodScreenState();
}

class _AddFoodScreenState extends State<AddFoodScreen> {
  final _formKey = GlobalKey<FormState>();

  String _foodName = '';
  double _dryMatter = 0;
  double _crudeProtein = 0;
  double _netEnergyGMcalKg = 0;
  double _metabolicEnergyMcalKg = 0;
  double _ndt = 0;
  double _calcium = 0;
  double _phosphorus = 0;
  double _crudeFiber = 0;
  double _fdn = 0;
  double _vitaminA = 0;
  double _vitaminD = 0;

  void _handleFormSubmit() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission and save the food data
      if (kDebugMode) {
        print('Food data:');
        print('  Food Name: $_foodName');
        print('  Dry Matter: $_dryMatter');
        print('  Crude Protein: $_crudeProtein');
        print('  Net Energy (GMcal/Kg): $_netEnergyGMcalKg');
        print('  Metabolic Energy (Mcal/Kg): $_metabolicEnergyMcalKg');
        print('  NDT: $_ndt');
        print('  Calcium: $_calcium');
        print('  Phosphorus: $_phosphorus');
        print('  Crude Fiber: $_crudeFiber');
        print('  FDN: $_fdn');
        print('  Vitamin A: $_vitaminA');
        print('  Vitamin D: $_vitaminD');
      }
    }
  }

  _buildTextFormField({
    required String labelText,
    required String hintText,
    required Function(String?) onSaved,
    TextInputType? keyboardType,
    required Function(String?) onChanged,
  }) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.black26,
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black12),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black12),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          keyboardType: keyboardType,
          onSaved: onSaved,
          onChanged: onChanged,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Introduzca un valor";
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

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
          'Add food screen',
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildTextFormField(
                  labelText: 'Alimento',
                  hintText: 'Nombre del Alimento',
                  onSaved: (value) => _foodName = value!,
                  onChanged: (text) => _foodName = text!,
                ),
                _buildTextFormField(
                  labelText: 'Materia Seca',
                  hintText: 'Materia Seca en %',
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _dryMatter = double.parse(value!),
                  onChanged: (text) => _dryMatter = double.parse(text!),
                ),
                _buildTextFormField(
                  labelText: 'Proteína Total',
                  hintText: 'Proteína Total en %',
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _crudeProtein = double.parse(value!),
                  onChanged: (text) => _crudeProtein = double.parse(text!),
                ),
                _buildTextFormField(
                  labelText: 'Energía Neta G. Mcal/Kg',
                  hintText: 'Energía Neta G. en Mcal/Kg',
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _netEnergyGMcalKg = double.parse(value!),
                  onChanged: (text) => _netEnergyGMcalKg = double.parse(text!),
                ),
                _buildTextFormField(
                  labelText: 'Energía Metab. Mcal/Kg',
                  hintText: 'Energía Metab. en Mcal/Kg',
                  keyboardType: TextInputType.number,
                  onSaved: (value) =>
                      _metabolicEnergyMcalKg = double.parse(value!),
                  onChanged: (text) =>
                      _metabolicEnergyMcalKg = double.parse(text!),
                ),
                _buildTextFormField(
                  labelText: 'NDT',
                  hintText: 'NDT en %',
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _ndt = double.parse(value!),
                  onChanged: (text) => _ndt = double.parse(text!),
                ),
                _buildTextFormField(
                  labelText: 'Calcio',
                  hintText: 'Calcio en %',
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _calcium = double.parse(value!),
                  onChanged: (text) => _calcium = double.parse(text!),
                ),
                _buildTextFormField(
                  labelText: 'Fósforo',
                  hintText: 'Fósforo en %',
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _phosphorus = double.parse(value!),
                  onChanged: (text) => _phosphorus = double.parse(text!),
                ),
                _buildTextFormField(
                  labelText: 'Fibra Cruda',
                  hintText: 'Fibra Cruda en %',
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _crudeFiber = double.parse(value!),
                  onChanged: (text) => _crudeFiber = double.parse(text!),
                ),
                _buildTextFormField(
                  labelText: 'FDN',
                  hintText: 'FDN en %',
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _fdn = double.parse(value!),
                  onChanged: (text) => _fdn = double.parse(text!),
                ),
                _buildTextFormField(
                  labelText: 'Vit. A',
                  hintText: 'Vitamina A en 1000 UI',
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _vitaminA = double.parse(value!),
                  onChanged: (text) => _vitaminA = double.parse(text!),
                ),
                _buildTextFormField(
                  labelText: 'Vit. D',
                  hintText: 'Vitamina D en 1000 UI',
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _vitaminD = double.parse(value!),
                  onChanged: (text) => _vitaminD = double.parse(text!),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: _handleFormSubmit,
                  child: const Text('Agregar Alimento'),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
