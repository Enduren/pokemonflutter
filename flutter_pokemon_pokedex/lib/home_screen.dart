import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokemon_pokedex/pokemon_detail_screen.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic>? pokedex; // Change List? to List<dynamic>?
  var pokeApi =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  @override
  void initState() {
    super.initState();
    fetchPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Stack(
        children: [
          Positioned(
            top: -50,
            right: -50,
            child: Image.asset(
              'images/pokeball.png',
              width: 200,
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            top: 80,
            left: 20,
            child: Text(
              "Pokedex",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            ),
          ),
          Positioned(
            top: 150,
            bottom: 0,
            width: width,
            child: Column(
              children: [
                Expanded(
                  child: pokedex != null
                      ? GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1,
                          ),
                          itemCount: pokedex!.length,
                          itemBuilder: (context, index) {
                            var type = pokedex![index]['type'][0];
                            return InkWell(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 12),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: type == 'Grass'
                                        ? Colors.greenAccent
                                        : type == 'Fire'
                                            ? Colors.redAccent
                                            : type == 'Water'
                                                ? Colors.blueAccent
                                                : type == 'Rock'
                                                    ? Colors.brown
                                                    : type == "Ground"
                                                        ? Colors.orangeAccent
                                                        : type == "Flying"
                                                            ? Colors.lightBlue
                                                            : type ==
                                                                    'Fighting'
                                                                ? Colors
                                                                    .amberAccent
                                                                : type == 'Bug'
                                                                    ? Colors
                                                                        .green
                                                                    : type ==
                                                                            'Poison'
                                                                        ? Colors
                                                                            .purpleAccent
                                                                        : type ==
                                                                                'Ghost'
                                                                            ? Colors
                                                                                .blueGrey
                                                                            : type ==
                                                                                    "Psychic"
                                                                                ? Colors.deepPurple
                                                                                : type == 'Dragon'
                                                                                    ? Colors.teal
                                                                                    : type == 'Ice'
                                                                                        ? Colors.lightBlueAccent
                                                                                        : type == 'Electric'
                                                                                            ? Colors.yellow
                                                                                            : Colors.grey,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        bottom: 10,
                                        right: -10,
                                        child: Image.asset(
                                          'images/pokeball.png',
                                          height: 100,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                      Positioned(
                                        top: 1,
                                        left: 20,
                                        width: width * 0.3,
                                        child: Text(
                                          pokedex![index]['name'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Positioned(
                                        top: 50,
                                        left: 20,
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0,
                                                right: 8.0,
                                                top: 1,
                                                bottom: 1),
                                            child: Text(
                                              type.toString(),
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              color: Colors.black26,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 5,
                                        right: 5,
                                        child: Hero(
                                          tag: index,
                                          child: CachedNetworkImage(
                                            imageUrl: pokedex![index]['img'],
                                            height: 120,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {
                                // TODO Nav to new screen
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => PokemonDetailScreen(
                                              pokemonDetails: pokedex![index],
                                              color: type == 'Grass'
                                        ? Colors.greenAccent
                                        : type == 'Fire'
                                            ? Colors.redAccent
                                            : type == 'Water'
                                                ? Colors.blueAccent
                                                : type == 'Rock'
                                                    ? Colors.brown
                                                    : type == "Ground"
                                                        ? Colors.orangeAccent
                                                        : type == "Flying"
                                                            ? Colors.lightBlue
                                                            : type ==
                                                                    'Fighting'
                                                                ? Colors
                                                                    .amberAccent
                                                                : type == 'Bug'
                                                                    ? Colors
                                                                        .green
                                                                    : type ==
                                                                            'Poison'
                                                                        ? Colors
                                                                            .purpleAccent
                                                                        : type ==
                                                                                'Ghost'
                                                                            ? Colors
                                                                                .blueGrey
                                                                            : type ==
                                                                                    "Psychic"
                                                                                ? Colors.deepPurple
                                                                                : type == 'Dragon'
                                                                                    ? Colors.teal
                                                                                    : type == 'Ice'
                                                                                        ? Colors.lightBlueAccent
                                                                                        : type == 'Electric'
                                                                                            ? Colors.yellow
                                                                                            : Colors.grey,
                                              heroTag: index,
                                            )));
                              },
                            );
                          },
                        )
                      : const Center(child: CircularProgressIndicator()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void fetchPokemonData() {
    var url = Uri.https("raw.githubusercontent.com",
        "/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var decodedJsonData = jsonDecode(value.body);
        setState(() {
          pokedex = decodedJsonData['pokemon'];
        });
      } else {
        print(value.statusCode);
      }
    });
  }
}
