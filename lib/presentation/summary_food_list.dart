import 'package:flutter/material.dart';

class Alimento {
  final String nombre;
  double cantidad;
  double costo;
  double costoUnitario;

  Alimento({
    required this.nombre,
    required this.cantidad,
    required this.costo,
    required this.costoUnitario,
  });
}

class SummaryFoodScreen extends StatefulWidget {
  final List<Alimento> alimentos;
  final double cantidadTotal;

  const SummaryFoodScreen({
    super.key,
    required this.alimentos,
    required this.cantidadTotal,
  });

  @override
  State<SummaryFoodScreen> createState() => _SummaryFoodState();
}

class _SummaryFoodState extends State<SummaryFoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Lista de Alimentos',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            // padding: const EdgeInsets.all(15),
            padding: const EdgeInsets.fromLTRB(15, 30, 15, 15),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Cantidad total (kg)',
                hintText: "Ejemplo: 20kg",
                hintStyle: const TextStyle(color: Colors.black26),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black12),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black12),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                if (value.isEmpty) {
                  setState(() {
                    _restablecerLista();
                  });
                } else {
                  setState(() {
                    _actualizarLista(double.parse(value));
                  });
                }
                // if (value.isNotEmpty) {
                //   setState(() {
                //     _actualizarLista(double.parse(value));
                //   });
                // }
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.alimentos.length,
              itemBuilder: (context, index) {
                final alimento = widget.alimentos[index];
                return ListTile(
                  title: Text(alimento.nombre),
                  subtitle: Text('${alimento.cantidad} kg'),
                  trailing: Text('S/.${alimento.costo}'),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Cantidad total: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '$_cantidadTotal kg',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Coste total: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '$_costeTotal \$',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _restablecerLista() {
    //arreglar, la cantidad por defecto que se envía es 0
    //o 1 para el precio unitario desde el main.dart
    for (final alimento in widget.alimentos) {
      alimento.cantidad = 1;
      alimento.costo = alimento.costoUnitario;
    }
    _cantidadTotal = 0;
    _costeTotal = 0;
  }

  void _actualizarLista(double cantidadTotal) {
    // Actualiza la cantidad y costo de cada alimento y totales
    for (final alimento in widget.alimentos) {
      alimento.cantidad = cantidadTotal / widget.alimentos.length;
      alimento.cantidad = double.parse(alimento.cantidad.toStringAsFixed(2));

      // Actualiza el costo de cada producto
      alimento.costo = alimento.costoUnitario * alimento.cantidad;
      alimento.costo = double.parse(alimento.costo.toStringAsFixed(2));
    }
    _cantidadTotal = cantidadTotal;
    _costeTotal = 0;

    for (final alimento in widget.alimentos) {
      _costeTotal += alimento.cantidad * alimento.costoUnitario;
    }
    _costeTotal = double.parse(_costeTotal.toStringAsFixed(2));
  }

  double _cantidadTotal = 0;
  double _costeTotal = 0;
}
