import 'package:flutter/material.dart';
import 'package:gradproj/screens/foodpart/selectedItems.dart';
import 'package:gradproj/theme/constants.dart';
import 'package:gradproj/widgets/button.dart';

import '../../widgets/text.dart';

class SearchField extends StatefulWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
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
      appBar: AppBar(
        title: const TextTitle(
          text: 'Another choices',
          textcolor: Colors.black
        )
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: TextField(
                onChanged: (value) => _runFilter(value),
                decoration: const InputDecoration(
                  hintText: 'Search',
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
              )),
              Expanded(
                child: _foundUsers.isNotEmpty
                    ? ListView.builder(
                        itemCount: _foundUsers.length,
                        itemBuilder: (context, index) => Card(
                          color: Colors.white,
                          key: ValueKey(_foundUsers[index]["name"]),
                          //elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            height: 70,
                            width: 200,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(15,5,15,0),
                                child: Column(
                                children: [
                                    SubTitle(
                                      text: _foundUsers[index]['name'],
                                      textcolor: Colors.black,
                                      weight: FontWeight.normal,
                                  ),
                                   Row(
                                     children: [
                                   SmallText(
                                      text: '${_foundUsers[index]["grams"].toString()} g',
                                      textcolor: Colors.black,
                                       weight: FontWeight.normal,
                                   )],)
                                  ])),
                                const Spacer(
                                  flex: 1,
                                ),
                                NormalText(
                                    text: '${_foundUsers[index]["cals"].toString()} Kcal',
                                   textcolor: Colors.black, weight: FontWeight.normal,
                                ),
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
             Padding(
                 padding: const EdgeInsets.only(top: 20,bottom: 20),
               child: CalculateButton(
                 title: 'Selected items',
                 onTap: (){
                   Navigator.of(context).push(
                     MaterialPageRoute(builder: (v) => const SelectedItems())
                   );
                 },
                 buttonbackcolor: kButtonColor,
                 buttontextcolor: Colors.white,
               )
             )
            ],
          ),
        ),
      ),
    );
  }
}
