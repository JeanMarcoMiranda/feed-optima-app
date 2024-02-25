import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodoptima/application/routes/app_router.dart';
import 'package:foodoptima/db/dao/food_list_dao.dart';
import 'package:foodoptima/models/food_list_model.dart';
import 'package:foodoptima/models/food_model.dart';
import 'package:foodoptima/providers/food_provider.dart';
import 'package:foodoptima/widgets/appbar_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:external_path/external_path.dart';
import 'package:provider/provider.dart';
import 'package:excel/excel.dart' as xls;
import 'package:path/path.dart';

class SummaryFoodScreen extends StatefulWidget {
  const SummaryFoodScreen({
    super.key,
  });

  @override
  State<SummaryFoodScreen> createState() => _SummaryFoodState();
}

class _SummaryFoodState extends State<SummaryFoodScreen> {
  double _totalQuantity = 0;
  double _totalCost = 0;

  @override
  Widget build(BuildContext context) {
    final foodListDao = FoodListDao();
    final List<FoodModel> foods = context.watch<FoodProvider>().foodList;

    return Scaffold(
      // appBar: AppBar(
      //   title: const Center(
      //     child: Text(
      //       'Lista de Alimentos',
      //       style: TextStyle(
      //           color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
      //     ),
      //   ),
      //   shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.vertical(
      //       bottom: Radius.circular(15),
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: "Final",
              actions: [
                IconButton(
                  onPressed: () {
                    context.pushNamed(RouteNames.home);
                  },
                  icon: const Icon(Icons.home),
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
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
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(15), // Adjust as needed
                          ),
                        ),
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
                                      _saveToPDF(
                                          nameFileController.text, foods);
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
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
                        child: const Row(
                          mainAxisSize: MainAxisSize
                              .min, // Ensure icon and text fit together
                          children: [
                            Icon(Icons
                                .picture_as_pdf), // Replace with your desired PDF icon
                            SizedBox(width: 6),
                            Text('PDF'),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(15), // Adjust as needed
                          ),
                        ),
                        onPressed: () async {
                          final nameFileController = TextEditingController();
                          await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Nombre del archivo'),
                                content: TextField(
                                  controller: nameFileController,
                                  decoration: const InputDecoration(
                                    labelText: 'Ingrese el nombre del archivo',
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text('Guardar'),
                                    onPressed: () {
                                      _saveToExcel(
                                          nameFileController.text, foods);
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'El documento Excel se guardó correctamente en la carpeta descarga'),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons
                                .table_chart), // Replace with your desired Excel icon
                            SizedBox(width: 6),
                            Text('Excel'),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(15), // Adjust as needed
                          ),
                        ),
                        onPressed: () async {
                          final nameFileController = TextEditingController();
                          await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Nombre de la lista'),
                                content: TextField(
                                  controller: nameFileController,
                                  decoration: const InputDecoration(
                                    labelText: 'Ingrese el nombre de la lista',
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text('Guardar'),
                                    onPressed: () async {
                                      final list = FoodListModel(
                                        name: nameFileController.text,
                                        totalCost: _totalCost,
                                      );
                                      await foodListDao.insertListFoodWithFoods(
                                          list, foods);
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'La lista se guardó correctamente en la aplicación'),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons
                                .star), // Replace with your desired Favorites icon
                            SizedBox(width: 6),
                            Text('Favoritos'),
                          ],
                        ),
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
                            _resetList(foods);
                          });
                        } else {
                          setState(() {
                            _updateList(double.parse(value), foods);
                          });
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: foods.length,
                      itemBuilder: (context, index) {
                        final food = foods[index];
                        return ListTile(
                          title: Text(
                            food.name,
                            style: const TextStyle(fontSize: 20),
                          ),
                          subtitle: Text(
                            'Cantidad: ${food.quantity} kg',
                            style: const TextStyle(
                                fontSize: 15, color: Colors.grey),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Costo x Unidad: S/.${food.unitCost}',
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.blue),
                                  ),
                                  Text(
                                    'Costo: S/.${food.cost}',
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.green),
                                  ),
                                ],
                              ),
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () =>
                                    _editUnitCost(context, food, foods),
                              ),
                            ],
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
                          'Cantidad total: $_totalQuantity kg',
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
                          'Coste total: S/.$_totalCost',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _resetList(List<FoodModel> foods) {
    //arreglar, la quantity por defecto que se envía es 0
    //o 1 para el precio unitario desde el main.dart
    for (final food in foods) {
      food.quantity = 1;
      food.cost = double.parse(food.unitCost.toStringAsFixed(2));
    }
    _totalQuantity = 0;
    _totalCost = 0;
  }

  void _updateList(double totalQuantity, List<FoodModel> foods) {
    // Actualiza la quantity y cost de cada food y totales
    for (final food in foods) {
      food.quantity = totalQuantity / foods.length;
      food.quantity = double.parse(food.quantity.toStringAsFixed(2));

      // Actualiza el cost de cada producto
      food.cost = (food.unitCost * food.quantity);
      food.cost = double.parse(food.cost.toStringAsFixed(2));
    }
    _totalQuantity = totalQuantity;
    _calculateTotalCost(foods);
  }

  void _calculateTotalCost(List<FoodModel> foods) {
    _totalCost = 0;
    for (final food in foods) {
      _totalCost += food.quantity * food.unitCost;
    }
    _totalCost = double.parse(_totalCost.toStringAsFixed(2));
  }

  Future<void> _saveToPDF(String name, List<FoodModel> foods) async {
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
                  'Lista de foods',
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
                  'Esta lista de foods es solo una guía. Es importante consultar con un profesional de la salud para obtener recomendaciones específicas para sus necesidades individuales.',
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
              pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [pw.Text("COSTO UNITARIO")]),
            ]),
            for (final food in foods)
              pw.TableRow(children: [
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [pw.Text(food.name)]),
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [pw.Text("${food.quantity.toString()} kg")]),
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [pw.Text("S/. ${food.cost.toString()}")]),
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [pw.Text("S/. ${food.unitCost.toString()}")]),
              ]),
            pw.TableRow(children: [
              pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [pw.Text("TOTAL")]),
              pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [pw.Text("$_totalQuantity kg")]),
              pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [pw.Text("S/. $_totalCost")]),
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

  void _editUnitCost(
      BuildContext context, FoodModel food, List<FoodModel> foods) {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController costController =
            TextEditingController(text: food.unitCost.toString());
        return AlertDialog(
          title: const Text('Editar Costo Unitario'),
          content: TextField(
            controller: costController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Costo Unitario',
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text('Guardar'),
              onPressed: () {
                if (costController.text.isEmpty) {
                  // El valor está vacío
                  food.unitCost = 0;
                } else {
                  // El valor no está vacío
                  food.unitCost = double.parse(costController.text);
                }
                food.cost = food.unitCost * food.quantity;
                food.cost = double.parse(food.cost.toStringAsFixed(2));

                _calculateTotalCost(foods);
                setState(() {});
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _saveToExcel(String name, List<FoodModel> foods) async {
    final excel = xls.Excel.createExcel();
    final creationDate = DateTime.now();
    final currentTime = DateFormat('HH-mm dd-MM-yyyy').format(creationDate);

    var sheet = excel['Sheet1'];

    var cell = sheet.cell(xls.CellIndex.indexByString("A1"));
    cell.value = const xls.TextCellValue("Lista de Alimentos");
    cell.cellStyle = xls.CellStyle(numberFormat: xls.NumFormat.standard_1);

    List<List<xls.TextCellValue>> list = List.generate(
      1,
      (index) => [
        const xls.TextCellValue('Nombre'),
        const xls.TextCellValue('Cantidad'),
        const xls.TextCellValue('Costo'),
        const xls.TextCellValue('Costo x Unidad'),
      ],
    );

    for (var row in list) {
      sheet.appendRow(row);
    }

    for (final food in foods) {
      sheet.appendRow([
        xls.TextCellValue(food.name),
        xls.TextCellValue(food.quantity.toString()),
        xls.TextCellValue(food.unitCost.toString()),
        xls.TextCellValue(food.cost.toString()),
      ]);
    }

    sheet.appendRow([
      xls.TextCellValue("Cantidad Total $_totalQuantity"),
      xls.TextCellValue("Costo Total $_totalCost"),
    ]);

    var fileBytes = excel.save();

    // Get external storage directory
    final path = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS);

    if (fileBytes != null) {
      File(join('$path/$name $currentTime.xlsx'))
        ..createSync(recursive: true)
        ..writeAsBytesSync(fileBytes);
    }
  }
}
