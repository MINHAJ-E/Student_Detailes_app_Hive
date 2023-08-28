import 'package:flutter/material.dart';
import 'package:flutter_hive_project_3/model/model.dart';
import 'package:hive_flutter/adapters.dart';

ValueNotifier<List<Studentmodel>> studentListNotifier = ValueNotifier([]);


 void insertStudent(Studentmodel value) async {
  final studentdb = await Hive.openBox<Studentmodel>('student_db');
  final id =await studentdb.add(value);
  value.id = id;
  studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();


}
getAllStudents() async {
  final studentdb = await Hive.openBox<Studentmodel>('student_db');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentdb.values);
  studentListNotifier.notifyListeners();
}

void deletestudent(int id) async {
  final studentdb = await Hive.openBox<Studentmodel>('student_db');
  await studentdb.deleteAt(id);
  getAllStudents();
}

Future<void>editList(int index,Studentmodel value)async {
 final studentdb = await Hive.openBox<Studentmodel>('student_db');
 studentListNotifier.value.clear();
 studentListNotifier.value.addAll(studentdb.values);
 
 studentdb.putAt(index, value);
 
}