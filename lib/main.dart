import 'package:catalogo_front/cubits/auth_cubit.dart';
import 'package:catalogo_front/models/user_model.dart';
import 'package:catalogo_front/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return ScopedModel<UserModel>(
      model: UserModel(),
      child: StreamBuilder<Object>(
        stream: null,
        builder: (context, snapshot) {
          return BlocProvider(
            create: (_) => AuthCubit() ,
            child: MaterialApp(
                title: "Talos",
                theme: ThemeData(
                  primarySwatch: Colors.brown,
                  primaryColor: const Color.fromRGBO(179, 162, 133, 0.5),
                  useMaterial3: false,
                ),
                debugShowCheckedModeBanner: false,
                home: AuthScreen(),
              )
          );
        }
      ),
    );
  }
}
