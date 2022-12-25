import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

  String _userEmail = '';
  String _userPassword = '';
  String _userName = '';

  var _loginMode = true;
  var _isLoading = false;

  UserCredential? _credential;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _submitForm() async {
    FocusScope.of(context).unfocus();
    setState(() {
      _isLoading = true;
    });
    _formKey.currentState?.save();
    if (_loginMode) {
      _credential = await _auth.signInWithEmailAndPassword(
          email: _userEmail, password: _userPassword);
    } else {
      _credential = await _auth.createUserWithEmailAndPassword(
          email: _userEmail, password: _userPassword);

      await _firestore.collection("users").doc(_credential?.user?.uid).set({
        "user_name": _userName,
        "user_email": _userEmail,
      });
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    key: ValueKey("email"),
                    decoration: InputDecoration(labelText: "Email"),
                    onSaved: (value) {
                      _userEmail = value.toString();
                    },
                  ),
                  TextFormField(
                    key: ValueKey("password"),
                    decoration: InputDecoration(labelText: "Password"),
                    onSaved: (value) {
                      _userPassword = value.toString();
                    },
                    obscureText: true,
                    onFieldSubmitted: (value) {
                      if (_loginMode) {
                        _submitForm();
                      }
                    },
                  ),
                  if (!_loginMode)
                    TextFormField(
                      key: ValueKey("confirm_password"),
                      decoration:
                          InputDecoration(labelText: "Confirm password"),
                      obscureText: true,
                    ),
                  if (!_loginMode)
                    TextFormField(
                      key: ValueKey("user_name"),
                      decoration: InputDecoration(labelText: "Username"),
                      onSaved: (value) {
                        _userName = value.toString();
                      },
                      onFieldSubmitted: (value) {
                        _submitForm();
                      },
                    ),
                  if (!_isLoading)
                    ElevatedButton(
                        onPressed: _submitForm,
                        child: Text(_loginMode ? "Login" : "Create Account")),
                  if (!_isLoading)
                    TextButton(
                        onPressed: () {
                          setState(() {
                            _loginMode = !_loginMode;
                          });
                        },
                        child: Text(_loginMode
                            ? "Create new account"
                            : "Login instead")),
                  if (_isLoading) CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
