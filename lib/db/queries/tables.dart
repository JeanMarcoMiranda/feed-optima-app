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
