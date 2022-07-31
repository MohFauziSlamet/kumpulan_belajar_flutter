import 'package:belajar_flutter/kuldi_projek/25.DatePicker/Textform_DatePicker/models/task.dart';
import 'package:flutter/material.dart';

class NewTaskForm extends StatefulWidget {
  const NewTaskForm({Key? key}) : super(key: key);

  @override
  _NewTaskFormState createState() => _NewTaskFormState();
}

class _NewTaskFormState extends State<NewTaskForm> {
  ///
  Task task = new Task(date: DateTime.now());

  ///
  final _formKey = GlobalKey<FormState>();

  ///
  TextEditingController _dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  ///
  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2019, 8),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      setState(
        () {
          selectedDate = picked;
          var date =
              "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";

          _dateController.text = date;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  return _selectDate(context);
                },
                child: AbsorbPointer(
                  child: TextFormField(
                    onSaved: (value) => task.name = value!,
                    decoration: InputDecoration(
                      labelText: 'Date',
                      icon: Icon(Icons.account_circle),
                    ),
                  ),
                ),
              ),
              //
              TextFormField(
                onSaved: (val) {
                  task.date = selectedDate;
                },
                controller: _dateController,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  labelText: "Tak Name",
                  icon: Icon(Icons.calendar_today),
                ),
                validator: (value) {
                  if (value!.isEmpty)
                    return "Please enter a date for your task";
                  return null;
                },
              ),
              ElevatedButton(
                child: Text("Submit"),
                // style: ButtonStyle(

                // textColor: Colors.white,
                // color: Colors.blueAccent,
                // ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    print(_dateController.text);
                  }
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
