import 'package:coffee_shop/providers/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key, required this.controler});
  final PageController controler;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              filled: true,
              fillColor: Colors.grey[200]!.withOpacity(0.8),
              prefixIcon: const Icon(Icons.email),
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
          TextField(
            controller: _confirmPasswordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              filled: true,
              fillColor: Colors.grey[200]!.withOpacity(0.8),
              prefixIcon: const Icon(Icons.lock),
            ),
          ),
          const SizedBox(height: 20),
          Consumer<UserdataProvider>(
            builder: (context, value, child) => SizedBox(
              width: 180,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  if (_passwordController.text !=
                      _confirmPasswordController.text) {
                    QuickAlert.show(
                        context: context,
                        type: QuickAlertType.error,
                        text: 'passwords doesnt match');
                    return;
                  }
                  value.createAcc(
                      _emailController.text, _passwordController.text, context);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Text('Sign up'),
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                controler.animateToPage(1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              },
              child: const Text('already have an account?'))
        ],
      ),
    );
  }
}
