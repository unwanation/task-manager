import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/providers/auth_provider.dart';
import 'package:task_manager/services/auth_service.dart';
import 'package:task_manager/utils/validator.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

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
            controller: _pass,
            decoration: const InputDecoration(labelText: 'Password'),
            validator: Validator.validatePassword,
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

                dynamic tokens = AuthService.login(_email.text, _pass.text);

                Provider.of<AuthProvider>(context).updateTokens(tokens);

                Navigator.of(context).pushNamed('/home');
              }
            },
            child: const Text('Submit'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/registration');
            },
            child: const Text('I don\'t have an account'),
          ),
        ],
      ),
    );
  }
}
