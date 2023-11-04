import 'package:coffee_shop/providers/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final PageController controller;

  LoginPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    UserdataProvider singinprovder = Provider.of<UserdataProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: 'Username',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              filled: true,
              fillColor: Colors.grey[200]!.withOpacity(0.8),
              prefixIcon: const Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              filled: true,
              fillColor: Colors.grey[200]!.withOpacity(0.8),
              prefixIcon: const Icon(Icons.lock),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 180,
            height: 45,
            child: ElevatedButton(
              onPressed: () {
                singinprovder.login(_usernameController.text,
                    _passwordController.text, context);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: const Text('Sign in'),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          SignInButton(
            Buttons.google,
            text: "Sign up with Google",
            onPressed: () {
              singinprovder.googleSignin(
                  _usernameController.text, _passwordController.text, context);
            },
          ),
          TextButton(
              onPressed: () {
                controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              },
              child: const Text('dont have an account?'))
        ],
      ),
    );
  }
}
