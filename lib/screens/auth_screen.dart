import 'package:catalogo_front/cubits/auth_cubit.dart';
import 'package:catalogo_front/cubits/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  late final AuthCubit cubit;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passController = TextEditingController();



  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<AuthCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Entrar"),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              
            },
            child: const Text("Criar Conta",
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              if (state is LoadedAuthState) {
                return const Center(child: Text("Logado"));
              } else if (state is LoadingAuthState) {
                return const Center(child: CircularProgressIndicator(),);
              } else if (state is InitialAuthState) {
                // return Center(child: Text(state.token));
                return Form(
                  key: _formKey,
                  child: ListView(
                    padding: const EdgeInsets.all(16.0),
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
                        hintText: "Senha"
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
                        child: const Text("Esqueci minha senha", textAlign: TextAlign.right,),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      height: 44.0,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            cubit.addToken(
                              email: _emailController.text,
                              pass: _passController.text
                              );
                          }
                        },
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
              } else {
                return Center(child: Text(cubit.token));
              }
            },
          )
        ],
      )
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
