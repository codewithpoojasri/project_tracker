import 'package:flutter/material.dart';
import 'package:project_tracker/services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();

  // Variables to hold form data
  String name = '';
  String rollNo = '';
  String phoneNo = '';
  String profilePic = '';  // This could be a URL or file path for the profile picture
  String username = '';
  String password = '';
  String emailId = '';
  int? batchId;  // Batch ID should be an integer
  String year = '';

  // Function to handle registration
  void _register() async {
    if (_formKey.currentState!.validate()) {
      try {
        final response = await _authService.register(
          name,
          rollNo,
          phoneNo,
          profilePic,
          username,
          password,
          emailId,
          batchId,
          year,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User registered successfully')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (value) => setState(() => name = value),
                validator: (value) => value!.isEmpty ? 'Enter your name' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Roll Number'),
                onChanged: (value) => setState(() => rollNo = value),
                validator: (value) => value!.isEmpty ? 'Enter roll number' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone Number'),
                onChanged: (value) => setState(() => phoneNo = value),
                validator: (value) => value!.isEmpty ? 'Enter phone number' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Profile Picture URL'),
                onChanged: (value) => setState(() => profilePic = value),
                validator: (value) => value!.isEmpty ? 'Enter profile picture URL' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Username'),
                onChanged: (value) => setState(() => username = value),
                validator: (value) => value!.isEmpty ? 'Enter username' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                onChanged: (value) => setState(() => password = value),
                validator: (value) => value!.isEmpty ? 'Enter password' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email ID'),
                onChanged: (value) => setState(() => emailId = value),
                validator: (value) => value!.isEmpty ? 'Enter email ID' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Batch ID'),
                keyboardType: TextInputType.number,
                onChanged: (value) => setState(() => batchId = int.tryParse(value ?? '')),
                validator: (value) => value!.isEmpty ? 'Enter batch ID' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Year'),
                onChanged: (value) => setState(() => year = value),
                validator: (value) => value!.isEmpty ? 'Enter year' : null,
              ),
              ElevatedButton(
                onPressed: _register,
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
