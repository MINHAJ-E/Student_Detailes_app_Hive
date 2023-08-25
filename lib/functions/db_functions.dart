import 'package:flutter/material.dart';
import 'package:flutter_hive_project_3/model/model.dart';
import 'package:hive_flutter/adapters.dart';

ValueNotifier<List<Studentmodel>> studentListNotifier = ValueNotifier([]);


 void insertStudent(Studentmodel value) async {
  final studentdb = await Hive.openBox<Studentmodel>('student_db');
  await studentdb.add(value);
  studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();


}
getAllStudents() async {
  final studentdb = await Hive.openBox<Studentmodel>('student_db');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentdb.values);
  studentListNotifier.notifyListeners();
}

void deletestudent(int index) async {
  final studentdb = await Hive.openBox<Studentmodel>('student_db');
  await studentdb.deleteAt(index);
  getAllStudents();
}