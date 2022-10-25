import 'package:flutter/material.dart';

class ListGrid extends StatefulWidget {
  const ListGrid({super.key});

  @override
  State<ListGrid> createState() => _ListGridState();
}

class _ListGridState extends State<ListGrid> {
  List<String> fruits = [
    'Banana',
    'Orange',
    'Pear',
    'Grapes',
    'Mango',
    'Apple'
  ];
  Map fruit_vs_person = {
    'fruits': ['Banana', 'Orange', 'Pear', 'Grapes', 'Mango', 'Apple'],
    'persons': ["Aqeel", "Usama", "Sohail", "Raheel", 'Shahrukh', 'Rizwan']
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("List and Grid"),
          backgroundColor: Colors.red,
          elevation: 20,
        ),
        body: Container(
          //     child: ListView.builder(
          //   itemCount: fruits.length,
          //   itemBuilder: (context, index) {
          //     return Card(
          //         child: ListTile(
          //       onTap: () => print(fruit_vs_person['fruits'][index]),
          //       leading: Icon(Icons.person),
          //       title: Text(fruit_vs_person['fruits'][index]),
          //       subtitle: Text(fruit_vs_person["persons"][index] + " ate my fruit"),
          //       tileColor: Colors.red,
          //     ));
          //   },
          // )),
          //     child: GridView(
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 4,
          //       crossAxisSpacing: 20,
          //       mainAxisSpacing: 20,
          //       childAspectRatio: 1 / 2),
          //   children: [
          //     Card(
          //       child: Center(child: Text('Orange')),
          //     ),
          //     Card(
          //       child: Center(child: Text('Orange')),
          //     ),
          //     Card(
          //       child: Center(child: Text('Orange')),
          //     ),
          //     Card(
          //       child: Center(child: Text('Orange')),
          //     ),
          //     Card(
          //       child: Center(child: Text('Orange')),
          //     ),
          //     Card(
          //       child: Center(child: Text('Orange')),
          //     ),
          //     Card(
          //       child: Center(child: Text('Orange')),
          //     ),
          //   ],
          // )
          child: GridView.builder(
              itemCount: fruit_vs_person['fruits'].length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return Card(
                  child: Center(
                    child: Text(fruit_vs_person['fruits'][index]),
                  ),
                );
              }),
        ));
  }
}
