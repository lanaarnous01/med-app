import 'package:flutter/material.dart';
import '../main.dart';
import '../models/listModel.dart';

class Patients with ChangeNotifier{


  List <Patient> getPatients() {
    return patients;
  }
  Patient findbyId (String id){ //name
  return patients.firstWhere((prod) => prod.id == id); //prod.name == name
}
  void addPatient (Patient patient){
  final newPatient = Patient(name: patient.name, wardNo: patient.wardNo, id: DateTime.now().toString(), numberHeart: patient.numberHeart,  numberPressure: patient.numberPressure, numberFever: patient.numberFever ); // numberHeart: patient.numberHeart, numberFever: patient.numberFever, numberPressure: patient.numberPressure
  patients.add(newPatient);
  notifyListeners();
}
  void addCategory(Category category, int io){
    final newCategory = Category(title: category.title, numberr: category.numberr, id: DateTime.now().toString(), icons: category.icons
);
    patients[io].categories.add(newCategory);
    notifyListeners();

  }
  void updatePatient(String id, Patient newPatient){ //Patient newPatient // String name
    final patientIndex = patients.indexWhere((pat) => pat.id == id); //pat.name == name
     if (patientIndex >=0){
      patients[patientIndex] = newPatient;
      notifyListeners();
    }else{
      print('.....');
    };
  }
  void deletePatient(String id){
    patients.removeWhere((pat) => pat.id == id);
    notifyListeners();
  }
}

List <Category> categories = [
  Category(
      title: 'Heart Rate',
      numberr: '9',
      icons: Icon(Icons.monitor_heart_outlined),
      id:  '1'
  ),

  Category(
      title: 'Blood Pressure',
      numberr: '98',
      icons: Icon(Icons.access_alarm_sharp),
      id: '2'
  ),
  Category(
      title: 'Fever',
      numberr: '36',
      icons: Icon(Icons.thermostat),
      id: '3'
  )

];
class Categories with ChangeNotifier{
//
// List <Category> get categories{
//   return[...categories];
// }
Category findbyIdCategory(String id){
  return categories.firstWhere((cat) => cat.id == id); // return _patients.firstWhere((prod) => prod.id == id);
}

 void updateNumberr(String title, Category newCategory){ //Patient newPatient // String name
    final patientIndex = categories.indexWhere((pat) => pat.title == title); //pat.name == name
    if (patientIndex >=0){
      categories[patientIndex] = newCategory;
      notifyListeners();
    }else{
      print('.....');
    }
  }

    void addActivity(List<Patient> activityHistory, String total){ //List<Patient> Category
    categories.insert(0,
    Category(
      id: DateTime.now().toString(),
      title: activityHistory,
      numberr: total
    //  numberr: numberrr
    )
    );
    notifyListeners();
  }

}
