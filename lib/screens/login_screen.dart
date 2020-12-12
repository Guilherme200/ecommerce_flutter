import 'package:ecommerce_flutter/providers/user_provider.dart';
import 'package:ecommerce_flutter/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldState = new GlobalKey();
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.purple,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 50),
                  child: Image.asset("assets/logos/logo.png",
                      color: Colors.white, width: 150),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    controller: _emailController,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                    keyboardType: TextInputType.emailAddress,
                    validator: (email) {
                      RegExp _regex = new RegExp(Constants.REGEX_EMAIL);

                      if (email.isEmpty || !_regex.hasMatch(email))
                        return "E-mail inválido";

                      return null;
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email, color: Colors.white),
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        focusColor: Colors.purple,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        contentPadding: EdgeInsets.all(22)),
                  ),
                ),
                TextFormField(
                  controller: _passController,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  keyboardType: TextInputType.text,
                  obscureText: isVisible,
                  validator: (pass) {
                    if (pass.isEmpty) {
                      return "Senha inválida!";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.white),
                      suffixIcon: IconButton(
                          icon: Icon(isVisible
                              ? Icons.visibility_off
                              : Icons.visibility),
                          color: Colors.white,
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          }),
                      hintText: 'Senha',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      contentPadding: EdgeInsets.all(22)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white,
                    child: MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(18),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            UserProvider().login(
                                email: _emailController.value.text,
                                password: _passController.value.text,
                                onFail: (error) {
                                  _showError(error);
                                },
                                onSuccess: (message) {
                                  _showSuccess(message);
                                  Navigator.pushNamed(context, '/home');
                                });
                          }
                        },
                        child: Text(
                          "Login",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.purple),
                        )),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: InkWell(
                      child: Container(
                        child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(18),
                            onPressed: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            child: Text(
                              "Cadastre-se",
                              textAlign: TextAlign.center,
                              style:
                              TextStyle(color: Colors.white, fontSize: 14),
                            )),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showError(String message) {
    _scaffoldState.currentState.showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Container(color: Colors.red, child: Text(message)),
      ),
    );
  }

  _showSuccess(String message) {
    _scaffoldState.currentState.showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Container(color: Colors.green, child: Text(message)),
      ),
    );
  }
}
