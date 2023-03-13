import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../providers/patients_providers.dart';
import 'package:provider/provider.dart';
import '../models/listModel.dart';
//addPatient_page
class addPatient_page extends StatefulWidget {
  static const routeName = '/editPatient'; //change to add
  const addPatient_page({Key? key}) : super(key: key);

  State<addPatient_page> createState() => _AddPageState();
}


class _AddPageState extends State<addPatient_page> {

  final _form = GlobalKey<FormState>();
  var _edited = Patient(name: '', wardNo: '', id: null, numberHeart: '', numberPressure: '', numberFever: '', );
  var _initValues = {
    'name': '',
    'wardNo.': '',
    'numberHeart': '',
    'numberPressure': '',
    'numberFever': ''
  };
  var _isInit = true;


  @override
  void didChangeDependencies() {
    if (_isInit){
      final patientNamee = ModalRoute.of(context)!.settings.arguments as dynamic;
     if (patientNamee != null)
     { _edited = Provider.of<Patients>(context, listen: false).findbyId(patientNamee);
      _initValues = {
          'name': _edited.name,
          'wardNo.': _edited.wardNo,
          'numberHeart': _edited.numberHeart,
          'numberPressure': _edited.numberPressure,
          'numberFever': _edited.numberFever
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
   //print in console
    print(_edited.name);
    print(_edited.wardNo);
    // List <Category> categories = [
    //   Category(t),
    //   Category(),
    //   Category(),
    // ];
  Map<String, int> categories = {
    'Heart Rate': 98,
    'Blood Pressure': 54,
    'Fever': 1,
  };
  var doc = await FirebaseFirestore.instance.collection("patient").add({
    "name": _edited.name,
    "wardNo": _edited.wardNo,
    "categories": categories,

  });
  await doc.update({
    "id": doc.id
  });
  //Adding patient in the patient list
//  if (_edited.name != null ) //name
//   { Provider.of<Patients>(context, listen: false).updatePatient(_edited.name, _edited);}
//   else
//Provider.of<Patients>(context).getPatients()[pateintData]
  Provider.of<Patients>(context, listen: false).addPatient(_edited);
  Navigator.of(context).pop();
}
 
  Widget buildName() => TextFormField(
    initialValue: _initValues['name'],
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigoAccent, width: 3)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigoAccent, width: 3)),
          labelText: 'Name',
        ),
        validator: (value) {
          if (value!.isEmpty){
            return 'Please enter name';
          }
          return null;
        },
        onSaved: (value) {
          _edited = Patient(name: value, wardNo: _edited.wardNo, id: _edited.id, numberHeart: _edited.numberHeart, numberPressure: value, numberFever: _edited.numberFever, );
        },
      );
  

  Widget buildWardNo() => TextFormField(
    initialValue: _initValues['wardNo.'],
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigoAccent, width: 3)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigoAccent, width: 3)),
          labelText: 'Ward No.',
        ),
        validator: (value) {
          if (value!.isEmpty){
            return 'Please enter Ward Number';
          }
          return null;
        },
        onSaved: (value) {
          _edited = Patient(name: _edited.name, wardNo: value, id: _edited.id, numberHeart: _edited.numberHeart, numberPressure: value, numberFever: _edited.numberFever, );
        },
      );

      Widget buildHeartRate() => TextFormField(
    initialValue: _initValues['numberHeart'],
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigoAccent, width: 3)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigoAccent, width: 3)),
          labelText: 'Heart Rate',
        ),
        validator: (value) {
          if (value!.isEmpty){
            return 'Please enter Heart rate';
          }
          return null;
        },
        onSaved: (value) {
          _edited = Patient(name: _edited.name, wardNo: _edited.wardNo, id: _edited.id, numberHeart: _edited.numberHeart, numberPressure: value, numberFever: _edited.numberFever,);
        },
      );

       Widget buildPressure() => TextFormField(
    initialValue: _initValues['numberPressure'],
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigoAccent, width: 3)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigoAccent, width: 3)),
          labelText: 'Blood Pressure',
        ),
        validator: (value) {
          if (value!.isEmpty){
            return 'Please enter Blood Pressure';
          }
          return null;
        },
        onSaved: (value) {
      _edited = Patient(name: _edited.name, wardNo: _edited.wardNo, id: _edited.id, numberHeart: _edited.numberHeart, numberPressure: value, numberFever: _edited.numberFever, );
        },
      );

    Widget buildFever() => TextFormField(
    initialValue: _initValues['numberFever'],
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigoAccent, width: 3)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigoAccent, width: 3)),
          labelText: 'Fever',
        ),
        validator: (value) {
          if (value!.isEmpty){
            return 'Please enter Fever';
          }
          return null;
        },
        onSaved: (value) {
      _edited = Patient(name: _edited.name, wardNo: _edited.wardNo, id: _edited.id, numberHeart: _edited.numberHeart, numberPressure: _edited.numberPressure, numberFever: value, );
        },
      );
  

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
         iconTheme: IconThemeData(color: Colors.indigoAccent),
          backgroundColor: Colors.transparent,
          title: Text('Add Patient',
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20,),
                    buildName(),
                    SizedBox(height: 50),
                    buildWardNo(),
                    SizedBox(height: 50),
                    // buildHeartRate(),
                    // SizedBox(height: 50),
                    // buildPressure(),
                    // SizedBox(height: 50),
                    // buildFever(),
                    // SizedBox(height: 50),
                    
                     IconButton(onPressed: _saveForm, icon: Icon(Icons.add_box_sharp, size: 50, color: Colors.blue,))
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}
