import 'package:flutter/material.dart';
import 'package:login_app/models/ChractersModelData.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  trysubmit() async {
    final isValid = _formKey.currentState?.validate();
    if (isValid != null && isValid) {
      _formKey.currentState!.save();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.black,
        content: Text(
          await submitForm(),
          style: const TextStyle(color: Colors.white),
        ),
        duration: const Duration(seconds: 2),
      ));
    } else {
      print("Error");
    }
  }

  submitForm() async {
    final token = await SharedPreferences.getInstance();
    if (_email == "hannan@gmail.com" && _password == '654321') {
      final user = HPChractersModel();

      String userToJson = hpChracterModelToJSON(user);

      print('Tujh ko chalna ho ga: $userToJson');
      await token.setString("@token",
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Imhhbm5hbkBnbWFpbC5jb20iLCJwYXNzd29yZCI6IjY1NDMyMSJ9.lxnfY6uZHcFkbU6jU6MaofeDJX4v0u2Y4cde2QnusT0");
      await token.setString("@user", userToJson);
      // ignore: use_build_context_synchronously
      // Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
      return "Login Succussful";
    } else {
      return "Invalid Credentials";
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              Container(
                height: screenHeight * 0.45,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/background.png'),
                        fit: BoxFit.fill)),
                child: const Center(
                    child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                )),
              ),
              Container(
                height: screenHeight * 0.35,
                margin: const EdgeInsets.all(30),
                // color: Colors.red,
                child: Center(
                    child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .5),
                                  blurRadius: 20,
                                  offset: Offset(0, 5))
                            ]),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade200))),
                              child: TextFormField(
                                key: const ValueKey('email'),
                                // inputFormatters: [
                                //   FilteringTextInputFormatter.allow(RegExp(
                                //       r'/^.*((?=.*[@]){1})((?=.*.com){1}).*$/'))
                                // ],
                                style: TextStyle(color: Colors.grey.shade400),
                                decoration: InputDecoration(
                                    hintText: "Enter email here",
                                    border: InputBorder.none,
                                    contentPadding:
                                        const EdgeInsets.only(left: 8),
                                    hintStyle:
                                        TextStyle(color: Colors.grey.shade400)),
                                validator: (value) {
                                  if (value.toString().isEmpty) {
                                    return 'Email should not be empty';
                                  } else if (RegExp(
                                          r'/^.*((?=.*[@]){1})((?=.*.com){1}).*$/')
                                      .hasMatch(value.toString())) {
                                    return 'Email should be valid';
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (newValue) {
                                  _email = newValue.toString();
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              child: TextFormField(
                                obscureText: true,
                                key: const ValueKey('password'),
                                style: TextStyle(color: Colors.grey.shade400),
                                decoration: InputDecoration(
                                  hintText: "Enter password here",
                                  border: InputBorder.none,
                                  contentPadding:
                                      const EdgeInsets.only(left: 5),
                                  hintStyle: TextStyle(
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                                validator: (value) {
                                  if (value.toString().length <= 5) {
                                    return 'Password should be of 6 character looonge';
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (newValue) {
                                  _password = newValue.toString();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 50,
                        width: 340,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(colors: [
                              Color.fromRGBO(143, 148, 251, 1),
                              Color.fromRGBO(143, 148, 251, .3),
                            ])),
                        child: TextButton(
                            onPressed: trysubmit,
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                )),
              ),
              Container(
                height: screenHeight * 0.12,
                child: Center(
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forget Password?',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(143, 148, 251, 1),
                          ),
                        ))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
