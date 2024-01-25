const createFoodTable = """
      CREATE TABLE alimentos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        dryMatter DOUBLE,
        totalProtein DOUBLE,
        netEnergyG DOUBLE,
        metabolizableEnergy DOUBLE,
        ndt DOUBLE,
        calcium DOUBLE,
        phosphorus DOUBLE,
        crudeFiber DOUBLE,
        fdn DOUBLE,
        vitaminA DOUBLE,
        vitaminD DOUBLE,
        quantity DOUBLE,
        cost DOUBLE,
        unitCost DOUBLE
      );
""";

const createCowRequirementsTable = """
      CREATE TABLE requerimientosVacas (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          peso_vivo TEXT,
          energia_metab DOUBLE,
          fibra_cruda DOUBLE,
          calcio DOUBLE,
          fosforo DOUBLE,
          vit_a DOUBLE,
          vit_d DOUBLE
      );
""";

const createBullRequirementsTable = """
    CREATE TABLE requerimientosToros (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        peso_vivo TEXT,
        energia_metab DOUBLE,
        fibra_cruda DOUBLE,
        calcio DOUBLE,
        fosforo DOUBLE,
        vit_a DOUBLE,
        vit_d DOUBLE,
        proteina DOUBLE,
        ms DOUBLE,
        numero INTEGER,
        raza TEXT
    );
""";

const createRestrictionsTable = """
    CREATE TABLE restricciones (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        alimento TEXT,
        restriccion TEXT
    );
""";

const createListFoodTable = """
    CREATE TABLE listaAlimentos (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      totalCost DOUBLE
    );
""";

const createFoodForFoodListTable = """
    CREATE TABLE alimentoParaListaAlimentos (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      alimento_id INTEGER NOT NULL,
      lista_alimentos_id INTEGER NOT NULL,
      FOREIGN KEY (alimento_id) REFERENCES alimentos(id),
      FOREIGN KEY (lista_alimentos_id) REFERENCES listaAlimentos(id)
    );
""";
