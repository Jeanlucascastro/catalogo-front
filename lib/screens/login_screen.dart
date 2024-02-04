import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrar"),
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
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                hintText: "E-mail",
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (text) {
                if (text != null) {
                  if (text.isEmpty || !text.contains("@")) return "E-mail invalido";
                }
              },
            ),
            const SizedBox(height: 16.0,),
            TextFormField(
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
      ),
    );
  }
}