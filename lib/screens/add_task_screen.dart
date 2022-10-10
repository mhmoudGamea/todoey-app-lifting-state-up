import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../providers/task_provider.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});

  // i make it static because when i fill my textField and press return mutton in my phone to hide
  // my keyboard it remove the text that i just typed in my textField
  // why it remove it ? because when you hide the keyboard it rebuild the build method and because
  // of that it erase what i typed in textField
  static final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.only(top: 25, left: 40, right: 40),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: ListView(
          children: [
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: fontName,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlueAccent,
                  fontSize: 30),
            ),
            TextField(
              controller: _controller,
              textAlign: TextAlign.center,
              cursorColor: Colors.lightBlueAccent,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 4)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 4)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 4)),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<TaskProvider>(context, listen: false).addTask(_controller.text);
                Navigator.pop(context);
                _controller.clear();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                elevation: 0,
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
              ),
              child: const Text(
                'Add',
                style: TextStyle(
                  fontFamily: fontName,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
