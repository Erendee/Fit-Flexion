import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  String _email = '';
  String _password = '';
  String _boy = '';
  String _kilo = '';
  String _error = '';

  Future<void> _saveUserToFirestore(
    String uid,
    String email,
    int boy,
    int kilo,
  ) async {
    await _firestore.collection('users').doc(uid).set({
      'email': email,
      'boy': boy,
      'kilo': kilo,
    });
  }

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      try {
        final userCredential = await _auth.createUserWithEmailAndPassword(
          email: _email.trim(),
          password: _password.trim(),
        );

        final uid = userCredential.user!.uid;

        await _saveUserToFirestore(
          uid,
          _email.trim(),
          int.parse(_boy),
          int.parse(_kilo),
        );

        setState(() => _error = '');
        context.go('/home');
      } on FirebaseAuthException catch (e) {
        setState(() => _error = e.message ?? 'Bir hata oluştu');
      } catch (e) {
        setState(() => _error = 'Hata: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.textTheme.titleLarge?.color ?? Colors.black;
    final inputTextColor = theme.textTheme.bodyMedium?.color ?? Colors.black87;
    final errorColor = theme.colorScheme.error;
    final primaryColor = theme.colorScheme.primary;
    final onPrimaryColor = theme.colorScheme.onPrimary;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Kayıt Olun',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: inputTextColor),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: inputTextColor.withOpacity(0.5),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: inputTextColor),
                  onChanged: (val) => _email = val,
                  validator: (val) => val != null && val.contains('@')
                      ? null
                      : 'Geçerli bir email girin',
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Şifre',
                    labelStyle: TextStyle(color: inputTextColor),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: inputTextColor.withOpacity(0.5),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                  ),
                  obscureText: true,
                  style: TextStyle(color: inputTextColor),
                  onChanged: (val) => _password = val,
                  validator: (val) => val != null && val.length >= 6
                      ? null
                      : 'Şifre en az 6 karakter olmalı',
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Boy (cm)',
                    labelStyle: TextStyle(color: inputTextColor),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: inputTextColor.withOpacity(0.5),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: inputTextColor),
                  onChanged: (val) => _boy = val,
                  validator: (val) => val != null && int.tryParse(val) != null
                      ? null
                      : 'Geçerli bir sayı girin',
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Kilo (kg)',
                    labelStyle: TextStyle(color: inputTextColor),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: inputTextColor.withOpacity(0.5),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: inputTextColor),
                  onChanged: (val) => _kilo = val,
                  validator: (val) => val != null && int.tryParse(val) != null
                      ? null
                      : 'Geçerli bir sayı girin',
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _register,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: onPrimaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12,
                    ),
                  ),
                  child: const Text('Kayıt Ol', style: TextStyle(fontSize: 18)),
                ),
                const SizedBox(height: 10),
                if (_error.isNotEmpty)
                  Text(
                    _error,
                    style: TextStyle(color: errorColor),
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
