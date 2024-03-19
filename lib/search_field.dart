import 'package:flutter/material.dart';
import 'package:gradproj/selectedItems.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> _allUsers = [
    {"name": "Apple", "grams": 100, "cals": 52},
    {"name": "Avocado", "grams": 100, "cals": 160},
    {"name": "Banana", "grams": 100, "cals": 89},
    {"name": "Mango", "grams": 100, "cals": 60},
    {"name": "Potato", "grams": 100, "cals": 77},
    {"name": "Potato Salad", "grams": 100, "cals": 143},
    {"name": "Corn", "grams": 100, "cals": 365},
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Container(
                  padding: EdgeInsets.only(right: 330, top: 12),
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: Color.fromARGB(255, 0, 0, 0),
                    size: 27,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (value) => _runFilter(value),
                decoration: const InputDecoration(
                  labelText: 'Search',
                  filled: true,
                  fillColor: Color(0xffECEAEA),
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: _foundUsers.isNotEmpty
                    ? ListView.builder(
                        itemCount: _foundUsers.length,
                        itemBuilder: (context, index) => Card(
                          key: ValueKey(_foundUsers[index]["name"]),
                          //elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            height: 70,
                            width: 200,
                            color: Colors.white,
                            child: Row(
                              children: [
                                Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      _foundUsers[index]['name'],
                                      style: const TextStyle(
                                          fontSize: 24,
                                          color: Color.fromARGB(255, 0, 0, 0)),
                                    ),
                                  ),
                                  Text(
                                      '${_foundUsers[index]["grams"].toString()} g',
                                      style: const TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0))),
                                ]),
                                Spacer(
                                  flex: 1,
                                ),
                                Text(
                                    '${_foundUsers[index]["cals"].toString()} Kcal',
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    )),
                                IconButton(
                                  iconSize: 20,
                                  icon: const Icon(
                                    Icons.add_circle,
                                  ),
                                  onPressed: () {
                                    setState(
                                      () {},
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : const Text(
                        'No results found',
                        style: TextStyle(fontSize: 24),
                      ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => selectedItems1(),
                  ));
                },
                child: Text(
                  'selected items',
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff0861E7),
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
