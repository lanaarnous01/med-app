import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/patients_providers.dart';
import '../pages/patientInfo.dart';
import '../models/listModel.dart';
class PatientInfoWidget extends StatefulWidget {
  const PatientInfoWidget({super.key});

  static const routeName = '/patientInfo-widget';
  @override
  State<PatientInfoWidget> createState() => _PatientInfoWidgetState();
}

class _PatientInfoWidgetState extends State<PatientInfoWidget> {
    
  @override
  Widget build(BuildContext context) {
    final patientName = ModalRoute.of(context)!.settings.arguments as String;
  final loadedPatient = Provider.of<Patients>(context).findbyId(patientName);
 final patientsData = Provider.of<Patients>(context);
    final patients = patientsData.getPatients();
     final categoriesData = Provider.of<Categories>(context);
   // final categories = categoriesData.categories;
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
        children: [
               Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          height: 50,
            decoration: BoxDecoration(
              color: Colors.indigoAccent, //amber accent
              borderRadius: BorderRadius.circular(20),
            
            ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  categories.elementAt(0).icons,
                  SizedBox(width: 50,),
                  Text('${categories.elementAt(0).title}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                  SizedBox(width: 110,),
                  Text(loadedPatient.numberHeart,          //'Age',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ],
              ),
            ),
                    Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          
          height: 50,
            decoration: BoxDecoration(
              color: Colors.indigoAccent, //amber accent
              borderRadius: BorderRadius.circular(20),
             // border: Border.all(color: Colors.blue)
             
            ),
              child: Row(
                children: [
                 categories.elementAt(1).icons, 

                  SizedBox(width: 50,),
                  Text('${categories.elementAt(1).title}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                  SizedBox(width: 70,),
                  Text(loadedPatient.numberPressure,          //'Age',
                 style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ],
              ),
            ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          
          height: 50,
            decoration: BoxDecoration(
              color: Colors.indigoAccent, //amber accent
              borderRadius: BorderRadius.circular(20),
             // border: Border.all(color: Colors.blue)
             
            ),
              child: Row(
                children: [
                 categories.elementAt(2).icons, 

                  SizedBox(width: 50,),
                  Text('${categories.elementAt(2).title}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                  SizedBox(width: 160,),
                  Text(loadedPatient.numberFever,          //'Age',
                 style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ],
              ),
            ),
        ],
      );
     
    
  }
}