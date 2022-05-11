import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

var database;

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  //create database
  database = openDatabase("cars.db", version: 1, onCreate: (db, version) {
    db.execute("CREATE TABLE cars(id INTEGER PRIMARY KEY,model TEXT,color TEXT)");
  });

  //delete(1);
  //insert(model: "Pegout",color: "white");
  update(2, "Volks", "black");
  retrieve();
}


//هتحط داتا جديدة
void insert({model,color}) async {
  var db = await database;
  await db.insert(
    'cars',
    {"model":model,"color":color}
  );
  print("a new record inserted");
}

//هتجيب الدتا
void retrieve() async {
  var db = await database;
  List<Map<String,dynamic>> cars = await db.query('cars');
  for(var car in cars){
    print(car);
  }
}

void delete(int id) async {
  var db = await database;
  await db.delete(
    'cars',
    where:'id = $id'
  );
}

void update(id,model,color) async{
  var db = await database;
  await db.update(
      'cars',
      {"model":model,"color":color},
      where:'id = $id'
  );
}





