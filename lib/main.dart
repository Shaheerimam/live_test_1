import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Add Employee')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  validator: (value) => (value == null || value.isEmpty)
                      ? 'Please enter a name'
                      : null,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextFormField(
                  validator: (value) => (value == null || value.isEmpty)
                      ? 'Please enter an age'
                      : null,
                  controller: _ageController,
                  decoration: InputDecoration(labelText: 'Age'),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a salary';
                    }
                    final salary = double.tryParse(value);
                    if (salary == null || salary <= 0) {
                      return 'Please enter a valid salary';
                    }
                    return null;
                  },
                  controller: _salaryController,
                  decoration: InputDecoration(labelText: 'Salary'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // If the form is valid, proceed with submission
                      final name = _nameController.text;
                      final age = _ageController.text;
                      final salary = _salaryController.text;

                      // Here you can handle the data, e.g., send it to a server or save it locally
                      print('Name: $name, Age: $age, Salary: $salary');
                    }
                    // Handle form submission
                  },
                  child: Text('Add Employee'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
