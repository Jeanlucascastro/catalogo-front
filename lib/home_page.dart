import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(
          color: Colors.yellow,
          child: const Text('Melhor Equipe'),
        ),
        Container(
          color: Colors.black,
          child: const Text('Best Crew'),
        )
      ],
      ),
    );
  }
}