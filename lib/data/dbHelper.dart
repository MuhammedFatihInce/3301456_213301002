import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/Product.dart';
import '../models/cart.dart';
import '../models/category.dart';

class DbHelper{
  Database? _db ;

  Future<Database?> get db async{
    _db ??= await initializeDb();
    return _db;
  }



  Future<Database> initializeDb() async{
    String dbPath = join(await getDatabasesPath(), "etrade.db");
    var eTradeDb = await openDatabase(dbPath, version: 7, onCreate: createDb, onUpgrade: _onUpgrade);
    return eTradeDb;
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    if (oldVersion < newVersion) {
       db.execute(
          'CREATE TABLE cart(id INTEGER PRIMARY KEY, productId VARCHAR UNIQUE, productName TEXT, initialPrice INTEGER, productPrice INTEGER, quantity INTEGER, image TEXT)');
    }
  }
  void createDb(Database db, int version) async{
    await db.execute("Create table products(id integer primary key, name text, photoUrl text, unitPrice text, categoryId integer, description text)");
    await db.execute("Create table categories(id integer primary key, categoryId integer,name text)");

  }


  Future<List<Product>> getProductsCategoryId(int? id) async{
    Database? db = await this.db;
    var result = await db?.rawQuery("SELECT products.name, photoUrl, description, unitPrice FROM products INNER JOIN categories on products.categoryId = categories.categoryId WHERE products.categoryId = $id");
    return List.generate(result!.length, (i){
      return Product.fromObject(result[i]);
    });
  }

  Future<List<Product>> getProducts() async{
    Database? db = await this.db;
    var result = await db?.query("products");
    return List.generate(result!.length, (i){
      return Product.fromObject(result[i]);
    });
  }

  Future<int?> insert(Product product) async{
    Database? db = await this.db;
    var result = await db?.insert("products", product.toMap());
    return result;
  }

  Future<int?> delete(int? id) async{
    Database? db = await this.db;
    var result = await db?.rawDelete("delete from products where id=$id");
    return result;
  }

  Future<int?> update(Product product) async{
    Database? db = await this.db;
    var result = await db?.update("products", product.toMap(), where: "id=?",whereArgs: [product.id]);
    return result;
  }


//------------------------------------------------------------------------------------------------------------------------------------------------------

  Future<List<Category>> getCategories() async{
    Database? db = await this.db;
    var result = await db?.query("categories");
    return List.generate(result!.length, (i){
      return Category.fromObject(result[i]);
    });
  }

  Future<int?> categoryInsert(Category category) async{
    Database? db = await this.db;
    var result = await db?.insert("categories", category.toMap());
    return result;
  }

  Future<int?> categoryDelete(int? id) async{
    Database? db = await this.db;
    var result = await db?.rawDelete("delete from categories where id=$id");
    return result;
  }

  Future<int?> categoryUpdate(Category category) async{
    Database? db = await this.db;
    var result = await db?.update("categories", category.toMap(), where: "id=?",whereArgs: [category.id]);
    return result;
  }

//------------------------------------------------------------------------------------------------------------------------------------------------------

  Future<List<Cart>> getCartList() async{
    Database? db = await this.db;
    var result = await db?.query("cart");
    return List.generate(result!.length, (i){
      return Cart.fromObject(result[i]);
    });
  }

  Future<int?> cartInsert(Cart cart) async{
    Database? db = await this.db;
    var result = await db?.insert("cart", cart.toMap());
    return result;
  }

  Future<int?> cartDelete(int? id) async{
    Database? db = await this.db;
    var result = await db?.rawDelete("delete from cart where id=$id");
    return result;
  }

  Future<int?> updateQuantity(Cart cart) async{
    Database? db = await this.db;
    var result = await db?.update("categories", cart.toMap(), where: "productId = ?", whereArgs: [cart.productId]);
    return result;
  }
}