import 'package:ecommerce_flutter/models/user_model.dart';
import 'package:ecommerce_flutter/providers/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  UserModel userModel = new UserModel();
  GlobalKey<ScaffoldState> _scaffoldState = new GlobalKey();
  bool isVisible = true;

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
                    child: Text(
                      "Cadastrar",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 35),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white, fontSize: 14),
                    validator: (name) {
                      if (name.isEmpty) {
                        return "Campo Obrigatório!";
                      }

                      return null;
                    },
                    onSaved: (name) {
                      userModel.firstName = name;
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.drive_file_rename_outline,
                            color: Colors.white),
                        hintText: 'Nome',
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white, fontSize: 14),
                    validator: (name) {
                      if (name.isEmpty) {
                        return "Campo Obrigatório!";
                      }

                      return null;
                    },
                    onSaved: (name) {
                      userModel.lastName = name;
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.drive_file_rename_outline,
                            color: Colors.white),
                        hintText: 'Sobrenome',
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white, fontSize: 14),
                    validator: (name) {
                      if (name.isEmpty) {
                        return "Campo Obrigatório!";
                      }

                      return null;
                    },
                    onSaved: (name) {
                      userModel.email = name;
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white, fontSize: 14),
                    obscureText: isVisible,
                    validator: (name) {
                      if (name.isEmpty) {
                        return "Campo Obrigatório!";
                      }

                      return null;
                    },
                    onSaved: (name) {
                      userModel.password = name;
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
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50, right: 8.0, left: 8.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white,
                    child: MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(18),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            UserProvider().register(
                              userModel,
                              onFail: (erro) {
                                print('dedededed');
                              },
                              onSuccess: () {
                                print("Cadastro Realizado com Sucesso");
                              },
                            );
                          }
                        },
                        child: Text(
                          "Cadastrar",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.purple),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
