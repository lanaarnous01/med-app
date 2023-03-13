import 'package:flutter/foundation.dart';
import 'package:hps_application/models/listModel.dart';
//import '../providers/patients_providers.dart';

class HistoryActivity{
  final String id;
  final List<Patient> patients;
  final DateTime dateTime;

  HistoryActivity({
   // required this.activity,
    required this.dateTime,
    required this.id,
    required this.patients
  });
}

class History with ChangeNotifier{
  List<HistoryActivity> _activity = [];
  List<HistoryActivity> get activity {
    return [..._activity];
  }
  void addHistory(List<Patient> activityHistory){
    _activity.insert(0, 
    HistoryActivity
    (id: DateTime.now().toString(),
    dateTime: DateTime.now(),
    patients: activityHistory
    ));
    notifyListeners();
  }
}
