import 'package:flutter/material.dart';
import 'package:foodoptima/db/dao/food_dao.dart';
import 'package:foodoptima/models/food_model.dart';

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
  final double _quantity = 1;
  double _unitCost = 0;

  Future<void> _handleFormSubmit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Save form values to fields
      // Create a FoodModel instance
      final food = FoodModel(
        name: _foodName,
        dryMatter: _dryMatter,
        totalProtein: _crudeProtein,
        netEnergyG: _netEnergyGMcalKg,
        metabolizableEnergy: _metabolicEnergyMcalKg,
        ndt: _ndt,
        calcium: _calcium,
        phosphorus: _phosphorus,
        crudeFiber: _crudeFiber,
        fdn: _fdn,
        vitaminA: _vitaminA,
        vitaminD: _vitaminD,
        quantity: _quantity,
        cost: _unitCost,
        unitCost: _unitCost,
      );

      // Insert the food into the database
      final foodDao = FoodDao();
      try {
        final id = await foodDao.insert(food);
        print('Food inserted with ID: $id');

        // Handle successful insertion (e.g., show a success message)
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Alimento agregado exitosamente!')),
        );
        // ignore: use_build_context_synchronously
        Navigator.pop(context, true);
      } catch (error) {
        // Handle database errors
        // print('Error inserting food: $error');
        // Show an error message to the user
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error al agregar alimento.')),
        );
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

  double parseDoubleOrZero(String? text) =>
      text?.trim().isEmpty == true ? 0.0 : double.tryParse(text!) ?? 0.0;

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
                  onSaved: (dynamic value) =>
                      _dryMatter = parseDoubleOrZero(value),
                  onChanged: (text) => _dryMatter = parseDoubleOrZero(text),
                ),
                _buildTextFormField(
                  labelText: 'Proteína Total',
                  hintText: 'Proteína Total en %',
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _crudeProtein = parseDoubleOrZero(value),
                  onChanged: (text) => _crudeProtein = parseDoubleOrZero(text),
                ),
                _buildTextFormField(
                  labelText: 'Energía Neta G. Mcal/Kg',
                  hintText: 'Energía Neta G. en Mcal/Kg',
                  keyboardType: TextInputType.number,
                  onSaved: (value) =>
                      _netEnergyGMcalKg = parseDoubleOrZero(value),
                  onChanged: (text) =>
                      _netEnergyGMcalKg = parseDoubleOrZero(text),
                ),
                _buildTextFormField(
                  labelText: 'Energía Metab. Mcal/Kg',
                  hintText: 'Energía Metab. en Mcal/Kg',
                  keyboardType: TextInputType.number,
                  onSaved: (value) =>
                      _metabolicEnergyMcalKg = parseDoubleOrZero(value),
                  onChanged: (text) =>
                      _metabolicEnergyMcalKg = parseDoubleOrZero(text),
                ),
                _buildTextFormField(
                  labelText: 'NDT',
                  hintText: 'NDT en %',
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _ndt = parseDoubleOrZero(value),
                  onChanged: (text) => _ndt = parseDoubleOrZero(text),
                ),
                _buildTextFormField(
                  labelText: 'Calcio',
                  hintText: 'Calcio en %',
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _calcium = parseDoubleOrZero(value),
                  onChanged: (text) => _calcium = parseDoubleOrZero(text),
                ),
                _buildTextFormField(
                  labelText: 'Fósforo',
                  hintText: 'Fósforo en %',
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _phosphorus = parseDoubleOrZero(value),
                  onChanged: (text) => _phosphorus = parseDoubleOrZero(text),
                ),
                _buildTextFormField(
                  labelText: 'Fibra Cruda',
                  hintText: 'Fibra Cruda en %',
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _crudeFiber = parseDoubleOrZero(value),
                  onChanged: (text) => _crudeFiber = parseDoubleOrZero(text),
                ),
                _buildTextFormField(
                  labelText: 'FDN',
                  hintText: 'FDN en %',
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _fdn = parseDoubleOrZero(value),
                  onChanged: (text) => _fdn = parseDoubleOrZero(text),
                ),
                _buildTextFormField(
                  labelText: 'Vit. A',
                  hintText: 'Vitamina A en 1000 UI',
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _vitaminA = parseDoubleOrZero(value),
                  onChanged: (text) => _vitaminA = parseDoubleOrZero(text),
                ),
                _buildTextFormField(
                  labelText: 'Vit. D',
                  hintText: 'Vitamina D en 1000 UI',
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _vitaminD = parseDoubleOrZero(value),
                  onChanged: (text) => _vitaminD = parseDoubleOrZero(text),
                ),
                _buildTextFormField(
                  labelText: 'Costo Unitario',
                  hintText: 'Costo en soles S/.',
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _unitCost = parseDoubleOrZero(value),
                  onChanged: (text) => _unitCost = parseDoubleOrZero(text),
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
