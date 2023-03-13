
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hps_application/pages/patientList.dart';
import 'package:provider/provider.dart';
import '../providers/patients_providers.dart';
import '../models/listModel.dart';
class UpdateSheet extends StatefulWidget {
static const routeName = '/updatePatient';
String id;
   UpdateSheet({
    super.key,
    required this.id,
  });

  @override
  State<UpdateSheet> createState() => _UpdateSheetState();
}

class _UpdateSheetState extends State<UpdateSheet> {
  //@override
    final _formm = GlobalKey<FormState>();
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
      final patientNamee = ModalRoute.of(context)!.settings.arguments as dynamic; //dynamic
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
void _saveForm() async {
  final isValid = _formm.currentState!.validate();
  if (!isValid){
    return;
  }
   _formm.currentState!.save();
  await FirebaseFirestore.instance.collection("patient").doc(widget.id).update({

    "name": _edited.name,
    "wardNo": _edited.wardNo,
  });
   //print in console
  //  print(_edited.name);
  //  print(_edited.wardNo);

  //Adding patient in the patient list
 if (_edited.id != null ) //name
   Provider.of<Patients>(context, listen: false).updatePatient(_edited.id, _edited); //edited.name
  //else

  // {Provider.of<Patients>(context, listen: false).addPatient(_edited);}
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => PatientListPage(), //if correct credintial
      ),
          (route) => false);}

 Widget buildName() => TextFormField(
    initialValue: _initValues['name'],
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigoAccent, width: 3)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigo, width: 3)),
          labelText: 'Name',
        ),
        validator: (value) {
          if (value!.isEmpty){
            return 'Please enter name';
          }
          return null;
        },
        onSaved: (value) {
          _edited = Patient(name: value, wardNo: _edited.wardNo, id: _edited.id, numberHeart: _edited.numberHeart, numberPressure: _edited.numberPressure,  numberFever: _edited.numberFever, );
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
          _edited = Patient(name: _edited.name, wardNo: value, id: _edited.id, numberHeart: _edited.numberHeart, numberPressure: _edited.numberPressure,  numberFever: _edited.numberFever, );
        },
      );

      Widget buildHeart() => TextFormField(
    initialValue: _initValues['numberHeart'],
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigoAccent, width: 3)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigo, width: 3)),
          labelText: 'Heart',
        ),
        validator: (value) {
          if (value!.isEmpty){
            return 'Please enter Heart rate';
          }
          return null;
        },
        onSaved: (value) {
          _edited = Patient(name: value, wardNo: _edited.wardNo, id: _edited.id, numberHeart: _edited.numberHeart, numberPressure: _edited.numberPressure,  numberFever: _edited.numberFever, );
        },
      );

      Widget buildPressure() => TextFormField(
    initialValue: _initValues['numberPressure'],
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigoAccent, width: 3)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigo, width: 3)),
          labelText: 'Pressure',
        ),
        validator: (value) {
          if (value!.isEmpty){
            return 'Please enter name';
          }
          return null;
        },
        onSaved: (value) {
          _edited = Patient(name: value, wardNo: _edited.wardNo, id: _edited.id, numberHeart: _edited.numberHeart, numberPressure: _edited.numberPressure,  numberFever: _edited.numberFever, );
        },
      );

       Widget buildFever() => TextFormField(
    initialValue: _initValues['numberFever'],
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigoAccent, width: 3)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigo, width: 3)),
          labelText: 'Fever',
        ),
        validator: (value) {
          if (value!.isEmpty){
            return 'Please enter Fever';
          }
          return null;
        },
        onSaved: (value) {
          _edited = Patient(name: value, wardNo: _edited.wardNo, id: _edited.id, numberHeart: _edited.numberHeart, numberPressure: _edited.numberPressure,  numberFever: _edited.numberFever, );
        },
      );

  Widget build(BuildContext context) {
    return 
    Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.indigoAccent),
          elevation: 0,
          title: Text('Update Details', 
            style: TextStyle(fontSize: 27,
        fontWeight: FontWeight.bold,
            color: Colors.indigoAccent// Colors.deepOrangeAccent// Colors.redAccent
     ),
          ),
          backgroundColor: Colors.transparent,
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
          key: _formm,
          child: ListView(padding: EdgeInsets.all(32), 
          
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(color: Colors.white10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildName(),
                   // SizedBox(height: 50),
                //    buildID(),
                    SizedBox(height: 50),
                 //   buildBirthday(),
                    SizedBox(height: 50),
                    buildWardNo(),
                    // SizedBox(height: 50),
                    // buildHeart(),
                    // SizedBox(height: 50,),
                    // buildPressure(),
                    // SizedBox(height: 50,),
                    // buildFever(),
                    // SizedBox(height: 30,),
                     IconButton(onPressed: _saveForm, icon: Icon(Icons.add))
                  ],
                ),
              ),
            ),
          ]),
        ));
                           
  }
}