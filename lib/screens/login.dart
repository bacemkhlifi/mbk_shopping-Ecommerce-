import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> loginUser() async {
    final url = Uri.parse('https://dummyjson.com/auth/login');
    final credentials = {
      'username': usernameController.text,
      'password': passwordController.text,
    };

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(credentials),
      );

      if (response.statusCode == 200) {
      final userData = json.decode(response.body);
      print('User authenticated: $userData');

      // Navigate to the home page after successful login
      Get.offAllNamed('/home'); // You may need to define a route for the home page
    } else {
      print('Failed to authenticate. Error code: ${response.statusCode}');
    }
    } catch (e) {
      print('Error: $e');
    }
  }
}

class LoginPage extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _loginController.usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _loginController.passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _loginController.loginUser(),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
