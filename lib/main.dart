import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SingleChildScrollView(
        child: SizedBox(
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 90,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                  'https://www.woolha.com/media/2020/03/eevee.png',
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: width / 1.3,
                child: Column(
                  children: const <Widget>[
                    LoginPageRows(title: "Kullanıcı Adı"),
                    SizedBox(height: 20),
                    LoginPageRows(title: "Şifre", isPassword: true),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: <Widget>[
                  const Text(
                    "Hesabın Yok Mu?",
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      primary: Colors.white,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Giriş Yap',
                      style: TextStyle(color: Colors.indigo),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "OR",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: width / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const <Widget>[
                        CustomSocialButton(icon: FontAwesomeIcons.google),
                        CustomSocialButton(icon: FontAwesomeIcons.facebook),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginPageRows extends StatefulWidget {
  final String title;
  final bool isPassword;
  const LoginPageRows({required this.title, this.isPassword = false, Key? key}) : super(key: key);

  @override
  _LoginPageRowsState createState() => _LoginPageRowsState();
}

class _LoginPageRowsState extends State<LoginPageRows> {
  bool _isObscure = true;

  void _toggleObscure() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1),
                )
              ],
            ),
            child: TextFormField(
              cursorColor: Colors.indigo,
              style: const TextStyle(color: Colors.indigo),
              obscureText: widget.isPassword ? _isObscure : false,
              decoration: InputDecoration(
                hintText: widget.title,
                hintStyle: const TextStyle(color: Colors.indigo),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
                suffixIcon: widget.isPassword
                    ? IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                          color: Colors.indigo,
                        ),
                        onPressed: _toggleObscure,
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSocialButton extends StatelessWidget {
  final IconData icon;
  const CustomSocialButton({required this.icon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Center(
          child: FaIcon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
