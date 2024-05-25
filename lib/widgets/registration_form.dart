import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/providers/auth_provider.dart';
import 'package:task_manager/services/auth_service.dart';
import 'package:task_manager/utils/validator.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  RegistrationFormState createState() {
    return RegistrationFormState();
  }
}

class RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TextFormField(
            controller: _email,
            decoration: const InputDecoration(labelText: 'Email'),
            validator: Validator.validateEmail,
          ),
          TextFormField(
            controller: _name,
            decoration: const InputDecoration(labelText: 'Name'),
            validator: (String? value) =>
                value!.isEmpty ? 'Name is required' : null,
          ),
          TextFormField(
            controller: _pass,
            decoration: const InputDecoration(labelText: 'Password'),
            validator: Validator.validatePassword,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Repeat Password'),
            validator: (String? value) => value!.isEmpty || value != _pass.text
                ? 'Passwords must match'
                : null,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );

                AuthService.register(_name.text, _email.text, _pass.text);

                dynamic tokens = AuthService.login(_email.text, _pass.text);

                Provider.of<AuthProvider>(context).updateTokens(tokens);

                Navigator.of(context).pushNamed('/home');
              }
            },
            child: const Text('Submit'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/login');
            },
            child: const Text('I am already a user'),
          ),
        ],
      ),
    );
  }
}
