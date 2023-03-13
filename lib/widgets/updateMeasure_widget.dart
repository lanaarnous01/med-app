import 'package:flutter/material.dart';
class UpdateMeasureWidget extends StatefulWidget {
 // const UpdateMeasureWidget({super.key});
  final dynamic title;
  final dynamic numberr;
  final String id;
  UpdateMeasureWidget(this.title, this.numberr, this.id);
  @override
  State<UpdateMeasureWidget> createState() => _UpdateMeasureWidgetState();
}

class _UpdateMeasureWidgetState extends State<UpdateMeasureWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(child: ListTile(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 2, color: Colors.indigo
        ),
        borderRadius: BorderRadius.circular(10),

      ),
      title: Text(widget.title, style: 
          TextStyle(
          color:  Colors.indigoAccent, 
            fontWeight: FontWeight.bold, fontSize: 20),),
          trailing: Text(widget.numberr, style:
           
          TextStyle(color: Colors.indigoAccent,  fontWeight: FontWeight.bold, fontSize: 20),),
          subtitle: Text(widget.id, style:
           
          TextStyle(color: Colors.indigoAccent,  fontWeight: FontWeight.bold, fontSize: 15),),
      ));
  }
}