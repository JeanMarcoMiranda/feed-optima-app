class CreateTable {
  String tableName;
  String primaryKey;
  Map<String, String> fields;
  Map<String, String>? foreignKeys;

  CreateTable(
      {this.foreignKeys,
      required this.tableName,
      required this.primaryKey,
      required this.fields});

  String create() {
    String sql = "CREATE TABLE $tableName (";

    // Primary key
    sql += "$primaryKey INTEGER PRIMARY KEY AUTOINCREMENT, ";

    // Fields
    fields.forEach((fieldName, fieldType) {
      sql += "$fieldName $fieldType, ";
    });

    // Foreign key
    if (foreignKeys != null && foreignKeys!.isNotEmpty) {
      foreignKeys!.forEach((fkName, fkReference) {
        sql += "FOREIGN KEY ($fkName) REFERENCES $fkReference, ";
      });
    }

    // Remove trailing comma and space
    sql = sql.substring(0, sql.length - 2);

    sql += ");";
    return sql;
  }
}
