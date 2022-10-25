import 'package:flutter/material.dart';
import 'package:login_app/models/ChractersModelData.dart';
import 'package:login_app/utils/extensions.dart';

class ReceivedDataModel {
  String screenName = "";
  HPChractersModel? item;

  ReceivedDataModel({
    this.item,
    required this.screenName,
  });
}

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  var profileData, screenName, isLoaded = false;

  @override
  Widget build(BuildContext context) {
    profileData =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object?>;
    final character = profileData['item'] as HPChractersModel;
    screenName = profileData['screenName'] as String;
    isLoaded = true;
    final subject = character.gender == 'male' ? "He" : "She";
    final subjective = character.gender == 'male' ? "His" : "Her";

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text(screenName),
          backgroundColor: const Color.fromRGBO(141, 147, 251, 1),
        ),
        body: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.85), BlendMode.lighten),
              image: const AssetImage('assets/app-background.jpeg'),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 50),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      height: 330,
                      width: 260,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage(character.image != ''
                              ? character.image
                              : 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    Wrap(
                      spacing: 10,
                      direction: Axis.vertical,
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          character.name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        if (character.alternateNames!.isNotEmpty)
                          Text(
                            'Also Knwon as ${character.alternateNames![0]}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        Text(
                          '${character.species[0].toUpperCase()}${character.species.substring(1).toLowerCase()}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          character.gender.capitalize(),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        if (character.house.isNotEmpty)
                          Text(
                            character.house,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        if (character.ancestry.isNotEmpty)
                          Text(
                            character.ancestry.capitalize(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        Text(
                          '$subject is ${character.wizard ? "a wizard" : "not a wizard"}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        if (character.eyeColour.isNotEmpty)
                          Text(
                            '$subjective eyes are ${character.eyeColour}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        if (character.hairColour.isNotEmpty)
                          Text(
                            '$subjective hair are ${character.hairColour}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        if (character.wand?.wood != '')
                          Text(
                            '$subjective wand name is ${character.wand?.wood.capitalize()}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        if (character.wand?.core != '')
                          Text(
                            '$subjective wand is made of ${character.wand?.core.capitalize()}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        if (character.patronus.isNotEmpty)
                          Text(
                            '$subjective pet is ${character.patronus.capitalize()}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        Text(
                          '$subject is ${character.alive ? "currently alive" : "dead"} in series',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        if (character.actor.isNotEmpty)
                          Text(
                            '${character.actor.capitalize()} portays this role ',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                      ],
                    )
                    // ])
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
