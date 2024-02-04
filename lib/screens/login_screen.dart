import 'package:catalogo_front/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Entrar"),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("Criar Conta",
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white
              ),
            ),
          ),
        ],
      ),
      body: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {
            if (model.isLoading) {
              return const Center(child: CircularProgressIndicator(),);
            } else {
              return Form(
                key: _formKey,
                child: ListView(
                  padding: EdgeInsets.all(16.0),
                  children: <Widget>[
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        hintText: "Usuario",
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (text) {
                        if (text != null) {
                          if (text.isEmpty) return "E-mail invalido";
                        }
                      },
                    ),
                    const SizedBox(height: 16.0,),
                    TextFormField(
                      controller: _passController,
                      decoration: const InputDecoration(
                        hintText: "Senha",
                      ),
                      obscureText: true,
                      validator: (text) {
                        if (text != null) {
                          if (text.isEmpty || text.length < 6) return "Senha invalida";
                        }
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text("Esqueci minha senha",
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      height: 44.0,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print("Button");
                            model.singIn(
                                email: _emailController.text,
                                pass: _passController.text,
                                onSuccess: _onSuccess,
                                onFail: _onFail
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.brown), // Define a cor de fundo do botão
                        ),
                        child: const Text("Entrar",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }

          }
      ),
    );
  }

  void _onSuccess() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Login realizado'),
      ),
    );
    // Navigator.of(context).pop();
  }

  void _onFail() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Falha ao realizar Login'),
      ),
    );
  }
}
