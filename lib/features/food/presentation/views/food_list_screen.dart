import 'package:flutter/material.dart';
import 'package:foodoptima/config/provider/food_provider.dart';
import 'package:foodoptima/config/routes/app_routes.dart';
import 'package:foodoptima/core/ui/widgets/app_bar_implementation.dart';
import 'package:foodoptima/features/food/data/models/food.dart';
import 'package:foodoptima/features/food/domain/usecases/get_food_all.dart';

import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../widgets/food_table_data.dart';
import '../widgets/food_table_search.dart';

class FoodListScreen extends StatefulWidget {
  const FoodListScreen({super.key});
  @override
  State<FoodListScreen> createState() => _FoodListScreenState();
}

class _FoodListScreenState extends State<FoodListScreen> {
  List<FoodModel> foods = [];
  List<FoodModel> selectedFoods = [];
  final columns = [
    'Alimentos',
    'Materia Seca',
    'Proteínas Total',
    'Energía Metab. Mcal/kg'
  ];

  @override
  void initState() {
    super.initState();
    _getFood();
  }

  Future<void> _getFood() async {
    final getFoodAllUseCase = context.read<GetFoodAllUseCase>();
    final result = await getFoodAllUseCase.call();

    result.when(
      success: (foods) {
        setState(() =>
            this.foods = foods.map((e) => FoodModel.fromEntity(e)).toList());
      },
      error: (error) {
        // Handle the error gracefully, e.g., display an error message
        debugPrint('Error fetching foods: $error');
        // Consider showing a user-friendly error message
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarImpl(
              title: "Lista de Alimentos",
              actions: [
                IconButton(
                    onPressed: () {
                      context
                          .pushNamed(AppRoutes.addFood)
                          .then((value) => setState(
                                () {
                                  _getFood();
                                },
                              ));
                    },
                    icon: const Icon(
                      Icons.add,
                    )),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () async {
                    final FoodModel? result = await showSearch<FoodModel>(
                      context: context,
                      delegate: DataSearch(foods),
                    );
                    if (result != null) {
                      setState(() {
                        selectedFoods.add(result);
                      });
                    }
                  },
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: ListView(padding: const EdgeInsets.all(0.0), children: [
                  PaginatedDataTable(
                    columns: getColumns(columns),
                    rowsPerPage: 12,
                    source: FoodDataSource(foods, selectedFoods),
                  ),
                ]),
              ),
            ),
          ],
        ),
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
            context
                .read<FoodProvider>()
                .changeFoodList(newFoodList: selectedFoods);
            context.pushNamed(AppRoutes.restrictions);
          }
        },
      ),
    );
  }

  List<DataColumn> getColumns(List<String> columns) =>
      columns.map((String column) => DataColumn(label: Text(column))).toList();
}
