import 'package:flutter/material.dart';
import 'package:flutter_pokemon_pokedex/home_screen.dart';

//You stopped at 1:25:45

void main() {
  runApp(const Pokedex());
}

class Pokedex extends StatelessWidget {
  const Pokedex({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
