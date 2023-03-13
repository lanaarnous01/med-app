import 'package:flutter/material.dart';

//addPatient_page
class Option_page extends StatefulWidget {
  const Option_page({Key? key}) : super(key: key);

  State<Option_page> createState() => _OptionPageState();
}

class _OptionPageState extends State<Option_page> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(padding: EdgeInsets.all(32), children: [
      Center(
        child: Container(
          decoration: BoxDecoration(color: Colors.white10),
          child: Column(
            children: [
              SizedBox(
                height: 270,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Card(
                      elevation: 0,
                      color: Theme.of(context).colorScheme.surfaceVariant,
                      child: const SizedBox(
                        width: 90,
                        height: 100,
                        child: Center(
                          child: Text('Nurse'),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Card(
                      elevation: 0,
                      color: Theme.of(context).colorScheme.surfaceVariant,
                      child: const SizedBox(
                        width: 120,
                        height: 100,
                        child: Center(
                          child: Text('Family member'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ]));
  }
}
