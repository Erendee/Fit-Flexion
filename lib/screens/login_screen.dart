import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  String _email = '';
  String _password = '';
  String _error = '';

  void _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth.signInWithEmailAndPassword(
          email: _email.trim(),
          password: _password.trim(),
        );
        setState(() {
          _error = '';
        });
        context.go('/home');
      } on FirebaseAuthException catch (e) {
        setState(() {
          switch (e.code) {
            case 'user-not-found':
              _error = 'Bu e-posta adresine ait bir hesap bulunamadı.';
              break;
            case 'wrong-password':
              _error = 'Şifreniz yanlış. Lütfen tekrar deneyin.';
              break;
            case 'invalid-email':
              _error = 'Geçersiz e-posta girdiniz.';
              break;
            case 'user-disabled':
              _error = 'Bu kullanıcı hesabı devre dışı bırakılmış.';
              break;
            default:
              _error = 'Giriş yapılamadı. Lütfen bilgilerinizi kontrol edin.';
              break;
          }
        });
      } catch (_) {
        setState(() {
          _error = 'Beklenmeyen bir hata oluştu. Lütfen tekrar deneyin.';
        });
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
                Text(
                  'Giriş Yapın',
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
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: onPrimaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12,
                    ),
                  ),
                  onPressed: _login,
                  child: const Text(
                    'Giriş Yap',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.push('/register');
                  },
                  child: Text(
                    'Hesabınız yoksa kayıt olmalısınız!',
                    style: TextStyle(color: errorColor),
                  ),
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
