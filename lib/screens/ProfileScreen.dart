import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';  // Make sure to import the LoginScreen

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String _name, _rollNo, _emailId;
  bool _isLoading = true;
  String _errorMessage = '';

  // Function to fetch user profile data
  Future<void> _fetchUserProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('jwt_token');

    if (token == null) {
      setState(() {
        _errorMessage = 'No token found. Please login again.';
        _isLoading = false;
      });
      return;
    }

    final response = await http.get(
      Uri.parse('http://localhost:5000/api/auth/student/profile'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',  // Send the token with the request
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _name = data['user']['name'];
        _rollNo = data['user']['roll_no'];
        _emailId = data['user']['email_id'];
        _isLoading = false;
      });
    } else {
      setState(() {
        _errorMessage = 'Failed to load user data';
        _isLoading = false;
      });
    }
  }

  // Logout function to clear token and navigate to login screen
  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('jwt_token');  // Remove the saved token
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),  // Redirect to Login Screen
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchUserProfile();  // Fetch profile data on screen load
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: _errorMessage.isEmpty
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: $_name', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Roll No: $_rollNo', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Email: $_emailId', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _logout,  // Call the logout function
              child: Text('Logout'),
            ),
          ],
        )
            : Center(child: Text(_errorMessage, style: TextStyle(color: Colors.red))),
      ),
    );
  }
}
