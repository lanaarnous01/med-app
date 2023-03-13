
import 'package:flutter/material.dart';
import 'package:hps_application/models/listModel.dart';
import 'package:hps_application/providers/patients_providers.dart';
import 'package:provider/provider.dart';
class UpdateMeasurements extends StatefulWidget {
  static const routeName = '/updateMeasurements';
  int? x;
   UpdateMeasurements({super.key,  this.x});

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

void _saveForm(){
  final isValid = _form.currentState!.validate();
  if (!isValid){
    return;
  }
   _form.currentState!.save();
  print('index $widget.x!');
    Provider.of<Patients>(context, listen: false).addCategory(_edited, widget.x!);
   //Provider.of<Categories>(context, listen: false).updateNumberr(_edited.numberr, _edited);
  Navigator.of(context).pop();
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

      Widget buildNumberr() => TextFormField(
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
      _edited = Category(title: _edited.title, numberr: value);
        },
      );
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
         iconTheme: IconThemeData(color: Colors.indigoAccent),
          backgroundColor: Colors.transparent,
          title: Text('Edit Patient',
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
                    buildTitle(),
                    SizedBox(height: 50),
                    buildNumberr(),
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