abstract class Dao<T> {
  //queries
  // String get createTableQuery;

  //abstract mapping methods
  T fromMap(Map<String, dynamic> map);
  List<T> fromList(List<Map<String, dynamic>> list);
  Map<String, dynamic> toMap();
}
