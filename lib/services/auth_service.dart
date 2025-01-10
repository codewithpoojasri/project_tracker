import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _baseUrl = 'http://localhost:5000/api/auth';

  // Register User
  Future<Map<String, dynamic>> register(
      String name,
      String rollNo,
      String phoneNo,
      String profilePic,
      String username,
      String password,
      String emailId,
      int? batchId,
      String year) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/register'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': name,
        'roll_no': rollNo,
        'phone_no': phoneNo,
        'profile_pic': profilePic,
        'username': username,
        'password': password,
        'email_id': emailId,
        'batch_id': batchId,
        'year': year,
      }),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to register user');
    }
  }

  // Login User
  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // Save the JWT token in shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('jwt_token', data['token']);
      return data;
    } else {
      throw Exception('Failed to login');
    }
  }

  // Get JWT Token from Shared Preferences
  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('jwt_token');
  }
}
