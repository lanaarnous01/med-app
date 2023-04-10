
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hps_application/main.dart';
import 'package:hps_application/models/listModel.dart';
import 'package:hps_application/providers/patients_providers.dart';
import 'package:provider/provider.dart';

import '../FirebaseThings/FirebaseVariables.dart';
class UpdateMeasurements extends StatefulWidget {
  static const routeName = '/updateMeasurements';
  String id;
   UpdateMeasurements({super.key, required this.id});

  @override
  State<UpdateMeasurements> createState() => _UpdateMeasurementsState();
}

class _UpdateMeasurementsState extends State<UpdateMeasurements> {

  final _form = GlobalKey<FormState>();
  var _edited = Category(id: null, title: '', numberr: '');
  var _initValues={
    'title': '',
    'numberr': ''
  };

  var _isInit = true;



  @override

  int HeartRate = 0;
  int Fever = 0;
  int BloodPresure = 0;
  void didChangeDependencies() {
   if (_isInit){
    final categoryName = ModalRoute.of(context)!.settings.arguments as dynamic;
    if (categoryName != null){
      _edited = Provider.of<Categories>(context, listen: false).findbyIdCategory(categoryName);
      _initValues = {
        'title': _edited.title,
        'numberr': _edited.numberr
      };
    }
   }
   _isInit = false;
    super.didChangeDependencies();
  }

void _saveForm() async{
  final isValid = _form.currentState!.validate();
  if (!isValid){
    return;
  }
   _form.currentState!.save();
  print('blood $BloodPresure!');
  print('HR $HeartRate!');
  print('Fever $Fever!');
  Map<String, int> q = {
    'Heart Rate': HeartRate,
    'Blood Pressure': BloodPresure,
    'Fever': Fever,
  };

  print(widget.id);

    await  patientCollection.doc(widget.id).update({

    "categories": FieldValue.arrayUnion([q]),
  });
  //  Provider.of<Categories>(context, listen: false).updateNumberr(_edited.numberr, _edited);
  //  Navigator.of(context).pop();
}

Widget buildTitle() => TextFormField(
    initialValue: _initValues['title'],
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigoAccent, width: 3)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigoAccent, width: 3)),
          labelText: 'Title',
        ),
        validator: (value) {
          if (value!.isEmpty){
            return 'Please enter name';
          }
          return null;
        },
        onSaved: (value) {
      _edited = Category(title: value, numberr: _edited.numberr);
        },
      );

      Widget buildNumberr(int number) => TextFormField(
    initialValue: _initValues['numberr'],
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigoAccent, width: 3)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigoAccent, width: 3)),
          labelText: 'Number',
        ),
        validator: (value) {
          if (value!.isEmpty){
            return 'Please enter number';
          }
          return null;
        },
        onSaved: (value) {

          if(number == 1)
            BloodPresure = int.parse(value!);
           if(number == 2)
            HeartRate = int.parse(value!);
          if(number == 3)
            Fever = int.parse(value!);
        }
      );
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
         iconTheme: IconThemeData(color: Colors.indigoAccent),
          backgroundColor: Colors.transparent,
          title: Text('Add Category',
           style: TextStyle(fontSize: 27,
        fontWeight: FontWeight.bold,
            color: Colors.indigoAccent// Colors.deepOrangeAccent// Colors.redAccent
     ),
          ),
      centerTitle: true,
                   shape: Border(
    bottom: BorderSide(
      color: Colors.indigoAccent,//Colors.deepOrangeAccent,
      width: 4
    )
  ),
          
        ),
        // backgroundColor: Color.fromARGB(255, 248, 85, 85),
        body: Form(
          key: _form,
          child: ListView(padding: EdgeInsets.all(32), 
          
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(color: Colors.white10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    Text("Blood Pressure", ),
                    buildNumberr(1),
                    SizedBox(height: 50),
                    Text("Heart Rate"),
                    buildNumberr(2),
                    SizedBox(height: 50),
                    Text("Fever"),
                    buildNumberr(3),
                    SizedBox(height: 50),


                    IconButton(onPressed: _saveForm, icon: Icon(Icons.add_box_sharp, size: 50, color: Colors.blue,))
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}