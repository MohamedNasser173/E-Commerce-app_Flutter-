import 'package:e_commerce/constants.dart';
import 'package:e_commerce/model/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class cartDatabaseHelper {
  cartDatabaseHelper._();
  static final cartDatabaseHelper dp = cartDatabaseHelper._();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDb();
    return _database;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'CartProduct.db');

    return openDatabase(path, version: 1, onCreate: (
      Database db,
      int version,
    ) async {
      await db.execute('''
      CREATE TABLE $kTableCartProduct(
      $kColumnName TEXT NOT NULL,
      $kColumnImage TEXT NOT NULL,
      $kColumnPrice TEXT NOT NULL,
      $kColumnQuantity INTEGER NOT NULL,
      $kColumnProductId TEXT NOT NULL)
      ''');
    });
  }

  Future<List<cartProductModel>?> getAllProduct() async {
    var dbClient = await database;
    List<Map>? maps = (await dbClient?.query(kTableCartProduct))?.cast<Map>();
    List<cartProductModel>? list =
        maps?.map((product) => cartProductModel.fromJason(product)).toList();

    return list;
  }

  insert(cartProductModel model) async {
    var dbClient = await database;
    await dbClient?.insert(kTableCartProduct, model.toJason(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  updateProduct(cartProductModel model) async {
    var dbClient = await database;
    return await dbClient?.update(kTableCartProduct, model.toJason(),
        where: '$kColumnProductId = ?', whereArgs: [model.productId]);
  }
}
