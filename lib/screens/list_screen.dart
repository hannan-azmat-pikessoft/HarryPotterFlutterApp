import 'package:flutter/material.dart';
// ignore: library_prefixes
// import 'package:flutter/services.dart' as rootBundle;
import 'package:login_app/models/ChractersModelData.dart';
// import 'package:login_app/models/HPChractersModelData.dart';
import 'package:login_app/services/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArrayListScreen extends StatefulWidget {
  const ArrayListScreen({super.key});

  @override
  State<ArrayListScreen> createState() => _ArrayListScreenState();
}

class _ArrayListScreenState extends State<ArrayListScreen> {
  List<HPChractersModel>? post;
  HPChractersModel? user;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getAsyncData();
    getCharactersData();
  }

  getAsyncData() async {
    final pref = await SharedPreferences.getInstance();
    // user = hpChracterModelFromJSON((pref.getString("@user")).toString());
    print("mil ja yaar bs kr:  ${pref.getString("@user").toString()}");
  }

  getCharactersData() async {
    post = await HarryPotterCharacters().getCharacters();

    if (post != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) async {
              if (value == "Profile") {
                Navigator.pushNamed(context, "/profile",
                    arguments: {"item": user, "screenName": "User Profile"});
              } else {
                final prefs = await SharedPreferences.getInstance();
                await prefs.remove("@token");

                // ignore: use_build_context_synchronously
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (_) => false);
              }
            },
            itemBuilder: (BuildContext context) {
              return {'Profile', 'Logout'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
        backgroundColor: const Color.fromRGBO(141, 147, 251, 1),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: FutureBuilder(
              // future: HarryPotterCharacters().getCharacters(),
              builder: (context, data) {
            if (!isLoaded) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                  itemCount: post?.length,
                  itemBuilder: (context, index) {
                    final character = post?[index];
                    String? imageData = character?.image != ''
                        ? character?.image
                        : 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png';
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/profile', arguments: {
                          "item": post?[index],
                          "screenName": "Character Profile"
                        });
                      },
                      child: Card(
                          elevation: 10,
                          shadowColor: const Color.fromRGBO(141, 147, 251, 0.5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                height: 120,
                                width: screenWidth * 0.55,
                                child: Wrap(
                                  direction: Axis.vertical,
                                  spacing: 3,
                                  children: [
                                    Text(
                                      '${post?[index].name}',
                                      maxLines: 1,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'House: ${post?[index].house}',
                                      maxLines: 1,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                        image:
                                            NetworkImage(imageData.toString()),
                                        fit: BoxFit.fill)),
                              ),
                            ],
                          )),
                    );
                  });
            }
          }),
        ),
      ),
    );
  }
}
