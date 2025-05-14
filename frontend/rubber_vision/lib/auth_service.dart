// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<User?> signUpWithEmail(String email, String password) async {
//     try {
//       final credential = await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return credential.user;
//     } catch (e) {
//       if (kDebugMode) {
//         print("Signup error: \$e");
//       }
//       return null;
//     }
//   }

//   Future<User?> signInWithEmail(String email, String password) async {
//     try {
//       final credential = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return credential.user;
//     } catch (e) {
//       if (kDebugMode) {
//         print("Login error: \$e");
//       }
//       return null;
//     }
//   }

//   Future<void> signOut() async {
//     await _auth.signOut();
//   }
// }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // 🔹 Call this method from UI with full details
  Future<User?> signUpWithEmailAndMySQL({
    required String name,
    required String email,
    required String mobile,
    required String password,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;

      if (user != null) {
        // 🔸 Register user in your MySQL DB
        await _registerToMySQL(
          name: name,
          email: email,
          mobile: mobile,
          password: password,
        );
      }

      return user;
    } catch (e) {
      if (kDebugMode) {
        print("Signup error: $e");
      }
      return null;
    }
  }

  // 🔹 Pure Firebase login
  Future<User?> signInWithEmail(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } catch (e) {
      if (kDebugMode) {
        print("Login error: $e");
      }
      return null;
    }
  }

  // 🔹 Firebase sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // 🔹 POST to PHP API (runs only if Firebase signup is successful)
  Future<void> _registerToMySQL({
    required String name,
    required String email,
    required String mobile,
    required String password,
  }) async {
    const String apiUrl = "http://192.168.0.4/register_user.php";

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          "full_name": name,
          "email": email,
          "mobile": mobile,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'success') {
          if (kDebugMode) print("MySQL registration success");
        } else {
          if (kDebugMode) print("MySQL registration error: ${data['message']}");
        }
      } else {
        if (kDebugMode) print("Server error: ${response.statusCode}");
      }
    } catch (e) {
      if (kDebugMode) print("HTTP error: $e");
    }
  }
}
