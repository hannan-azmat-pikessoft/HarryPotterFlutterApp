import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";

  trysubmit() {
    final isValid = _formKey.currentState?.validate();
    if (isValid != null && isValid) {
      _formKey.currentState!.save();
      submitForm();
    } else {
      print("Error");
    }
  }

  submitForm() {
    print("the email" + _email);
    print("the password" + _password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forms"),
      ),
      body: Center(
          child: Container(
        margin: const EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: "Enter Email Here"),
                key: const ValueKey("email"),
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return "Email should not be empty";
                  } else {
                    return null;
                  }
                },
                onSaved: (newValue) {
                  _email = newValue.toString();
                },
              ),
              TextFormField(
                obscureText: true,
                decoration:
                    const InputDecoration(hintText: "Enter Password Here"),
                key: const ValueKey("password"),
                validator: (value) {
                  if (value.toString().length <= 5) {
                    return "Password should be of 6 character";
                  } else {
                    return null;
                  }
                },
                onSaved: (newValue) {
                  _password = newValue.toString();
                },
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                  onPressed: trysubmit,
                  child: const Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
