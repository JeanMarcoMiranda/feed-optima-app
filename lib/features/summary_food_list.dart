import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodoptima/models/food_model.dart';
import 'package:foodoptima/providers/food_provider.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:external_path/external_path.dart';
import 'package:provider/provider.dart';

class SummaryFoodScreen extends StatefulWidget {
  const SummaryFoodScreen({
    super.key,
  });

  @override
  State<SummaryFoodScreen> createState() => _SummaryFoodState();
}

class _SummaryFoodState extends State<SummaryFoodScreen> {
  double _cantidadTotal = 0;
  double _costeTotal = 0;

  @override
  Widget build(BuildContext context) {
    final List<FoodModel> alimentos = context.watch<FoodProvider>().foodList;

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
          const SizedBox(
            height: 25,
          ),
          const Text(
            'Guardar en:',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Guardar en PDF
                  final nameFileController = TextEditingController();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Nombre del archivo'),
                        content: TextField(
                          controller: nameFileController,
                          decoration: const InputDecoration(
                            labelText: 'Ingrese el name del archivo',
                          ),
                        ),
                        actions: [
                          TextButton(
                            child: const Text('Guardar'),
                            onPressed: () {
                              // Guarda el documento PDF con el name especificado por el usuario
                              guardarEnPDF(nameFileController.text, alimentos);
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'El documento PDF se guardó correctamente en la carpeta descarga'),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('PDF'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Guardar en Excel
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Próximamente...'),
                    ),
                  );
                },
                child: const Text('Excel'),
              ),
            ],
          ),
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
                    _restablecerLista(alimentos);
                  });
                } else {
                  setState(() {
                    _actualizarLista(double.parse(value), alimentos);
                  });
                }
              },
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: alimentos.length,
              itemBuilder: (context, index) {
                final alimento = alimentos[index];
                return ListTile(
                  title: Text(
                    alimento.name,
                    style: const TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(
                    'Cantidad: ${alimento.quantity} kg',
                    style: const TextStyle(fontSize: 15),
                  ),
                  trailing: Text(
                    'Costo: S/.${alimento.cost}',
                    style: const TextStyle(fontSize: 14),
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  const Divider(color: Colors.grey, thickness: 1),
            ),
          ),
          Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Cantidad total: $_cantidadTotal kg',
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                const Text(
                  ' | ',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  'Coste total: S/.$_costeTotal',
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _restablecerLista(List<FoodModel> alimentos) {
    //arreglar, la quantity por defecto que se envía es 0
    //o 1 para el precio unitario desde el main.dart
    for (final alimento in alimentos) {
      alimento.quantity = 1;
      alimento.cost = alimento.unitCost;
    }
    _cantidadTotal = 0;
    _costeTotal = 0;
  }

  void _actualizarLista(double cantidadTotal, List<FoodModel> alimentos) {
    // Actualiza la quantity y cost de cada alimento y totales
    for (final alimento in alimentos) {
      alimento.quantity = cantidadTotal / alimentos.length;
      alimento.quantity = double.parse(alimento.quantity!.toStringAsFixed(2));

      // Actualiza el cost de cada producto
      alimento.cost = (alimento.unitCost! * alimento.quantity!);
      alimento.cost = double.parse(alimento.cost!.toStringAsFixed(2));
    }
    _cantidadTotal = cantidadTotal;
    _costeTotal = 0;

    for (final alimento in alimentos) {
      _costeTotal += alimento.quantity! * alimento.unitCost!;
    }
    _costeTotal = double.parse(_costeTotal.toStringAsFixed(2));
  }

  Future<void> guardarEnPDF(String name, List<FoodModel> alimentos) async {
    // Crea un documento PDF
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final creationDate = DateTime.now();
    final formattedCreationDate = DateFormat('dd/MM/yyyy').format(creationDate);
    final currentTime = DateFormat('HH-mm dd-MM-yyyy').format(creationDate);

    // Agrega el título al documento
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.Text(
                  'Lista de alimentos',
                  style: const pw.TextStyle(fontSize: 30),
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Text(
                  formattedCreationDate,
                  style: const pw.TextStyle(fontSize: 12),
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Text(
                  'Esta lista de alimentos es solo una guía. Es importante consultar con un profesional de la salud para obtener recomendaciones específicas para sus necesidades individuales.',
                  style: const pw.TextStyle(fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );

    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Table(border: pw.TableBorder.all(), children: [
            pw.TableRow(children: [
              pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [pw.Text("ALIMENTO")]),
              pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [pw.Text("CANTIDAD")]),
              pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [pw.Text("COSTO")]),
            ]),
            for (final alimento in alimentos)
              pw.TableRow(children: [
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [pw.Text(alimento.name)]),
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [pw.Text("${alimento.quantity.toString()} kg")]),
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [pw.Text("S/. ${alimento.cost.toString()}")]),
              ]),
            pw.TableRow(children: [
              pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [pw.Text("TOTAL")]),
              pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [pw.Text("$_cantidadTotal kg")]),
              pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [pw.Text("S/. $_costeTotal")]),
            ]),
          ]);
        }));

    final output = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS);
    final file = File('$output/$name $currentTime.pdf');
    if (!await file.exists()) {
      await file.writeAsBytes(await pdf.save());
    }
  }
}
