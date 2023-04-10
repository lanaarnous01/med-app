
import 'package:hps_application/models/listModel.dart';
import 'package:hps_application/pages/addPatient_page.dart';
//import 'package:hps_application/widgets/updateSheet.dart';
//import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:hps_application/widgets/patientInfo_widget.dart';
import 'package:hps_application/widgets/updateSheet.dart';
//import 'package:hps_application/pages/patientList.dart';
import '../pages/patientInfo.dart';
import 'package:provider/provider.dart';
import '../providers/patients_providers.dart';
//import '../widgets/updateSheet.dart';
//import'../providers/patients_providers.dart';


class PatientList extends StatefulWidget {
 //changed to stateful
  //final String id;
  final String name;
  final String wardNo;
  final String id;
 // final Function deleteHandler;

  PatientList(this.name, this.wardNo, 
  this.id, //this.deleteHandler
  );

  @override
  State<PatientList> createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
 // const PatientList({super.key});
//  final _form = GlobalKey<FormState>();

//  var _editedPatient = Patient(name: '', wardNo: '');

//  var _init = true;

//  void _saveForm() {
  @override
  Widget build(BuildContext context) {
    // consumer added 
    // consumer is for fav (might remove)
    return 
    // Consumer<Patient>(
    //   builder: (context, value, child) => 
       Form(
       // key: _form,
         child: ListTile(
          shape: RoundedRectangleBorder(
            
    side: BorderSide(width: 2, color: Colors.indigoAccent), //redAccent
    borderRadius: BorderRadius.circular(50),
  ),
          title: Text(widget.name, style: 
          TextStyle(
          color:  Colors.indigoAccent, 
            fontWeight: FontWeight.bold, fontSize: 20),),
          subtitle: Text(widget.wardNo, style: 
          TextStyle(color: Colors.indigoAccent,  fontWeight: FontWeight.bold, fontSize: 15),),
          leading: Icon(Icons.account_circle_rounded, size: 40, color: Colors.indigoAccent, ),
          trailing: Container(
            width: 100,
            child: Row(
              children: [
                 IconButton(
                              onPressed: (() {

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => UpdateSheet(id: widget.id,),
                                  ),
                                );
                             
                              }
                              ), icon: Icon(Icons.edit, color: Colors.indigoAccent, )
                              ),
                IconButton(onPressed: (() {
               Provider.of<Patients>(context, listen: false).deletePatient(widget.id);
                }), 
                icon: Icon(Icons.delete, color: Colors.indigoAccent, )),
                
              ],
            ),
          ),
          
       
            onTap: () {
              //pushNamed
             Navigator.push(
               context,
               MaterialPageRoute(
                 builder: (_) => patientInfo_page(id: widget.id,),
               ),
             );


            },
          
             ),
       );
   // );
  }
}