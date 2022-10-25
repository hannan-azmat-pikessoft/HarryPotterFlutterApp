import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: ListView(
            children: [
              DrawerHeader(
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                              "https://www.arweave.net/HMPNRDPf2pY5F8HfImUe3Cs1sfHDrZKDykhjy0iFee4?ext=jpg"),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Splash User",
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              "splashuser@gmail.com",
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
              const ListTile(
                leading: Icon(
                  Icons.folder,
                  color: Colors.black,
                ),
                title: Text("My Files", style: TextStyle(color: Colors.black)),
              ),
              const ListTile(
                leading: Icon(
                  Icons.group,
                  color: Colors.black,
                ),
                title: Text("My Gropus", style: TextStyle(color: Colors.black)),
              ),
              const ListTile(
                leading: Icon(
                  Icons.star,
                  color: Colors.black,
                ),
                title: Text("My Starred List",
                    style: TextStyle(color: Colors.black)),
              ),
              const ListTile(
                leading: Icon(
                  Icons.delete,
                  color: Colors.black,
                ),
                title:
                    Text("Trash List", style: TextStyle(color: Colors.black)),
              ),
              const ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
                title: Text("Logout", style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Drawer Widget"),
      ),
      body: Container(
        child: Center(child: const Text("Txt")),
      ),
    );
  }
}
