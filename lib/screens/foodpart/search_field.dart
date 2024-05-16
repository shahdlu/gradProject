import 'package:cloud_firestore/cloud_firestore.dart';
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
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextTitle(
          text: 'Another choices',
          textcolor: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: TextField(
                controller: _searchController,
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
              ),
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection('another_food').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }
                if (snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text('No data available'),
                  );
                }

                final filteredDocs = snapshot.data!.docs.where((doc) {
                  final name = doc['name'].toString().toLowerCase();
                  return name.contains(_searchQuery.toLowerCase());
                }).toList();

                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: filteredDocs.length,
                    itemBuilder: (context, index) {
                      var item = filteredDocs[index];
                      var name = item['name'];
                      var kcal = item['kcal'];
                      return SearchListViewItem(name: name, kcal: kcal);
                    },
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: CalculateButton(
                title: 'Selected items',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (v) => const SelectedItems()),
                  );
                },
                buttonbackcolor: kButtonColor,
                buttontextcolor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchListViewItem extends StatefulWidget {
  const SearchListViewItem({super.key, required this.name, required this.kcal});
  final String name;
  final num? kcal;

  @override
  State<SearchListViewItem> createState() => _SearchListViewItemState();
}

class _SearchListViewItemState extends State<SearchListViewItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: double.infinity,
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SubTitle(
                    text: widget.name,
                    textcolor: Colors.black,
                    weight: FontWeight.normal,
                  ),
                  const SmallText(
                    text: '100 g',
                    textcolor: Colors.black,
                    weight: FontWeight.normal,
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    NormalText(
                      text: '${widget.kcal} Kcal',
                      textcolor: Colors.black,
                      weight: FontWeight.normal,
                    ),
                    IconButton(
                      iconSize: 20,
                      icon: const Icon(
                        Icons.add_circle,
                      ),
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
