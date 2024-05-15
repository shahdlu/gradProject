import 'package:flutter/material.dart';
import 'package:gradproj/screens/foodpart/search_field.dart';
import 'package:gradproj/theme/constants.dart';
import '../../widgets/cards.dart';
import '../../widgets/text.dart';


  class SelectedItems extends StatefulWidget {
    const SelectedItems({super.key});
  @override
  _SelectedItemsState createState() => _SelectedItemsState();
  }

  class _SelectedItemsState extends State<SelectedItems> {
    int _current_index = 0;
  List<String> selected_items = ['Pizza','egg','meat'];
  List<String> selected_items_grams = ['100','50','200'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kButtonColor,
        foregroundColor: Colors.white,
        title: TextTitle(
          text: 'Slected items',
          textcolor: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              color: Color(0xff0861E7),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 60, top: 30),
                          child: Row(
                            children: [
                              SubTitle(
                                text: "Eaten",
                                textcolor: Colors.white,
                                weight: FontWeight.bold,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 100),
                              child: SubTitle(
                                text: "Remining",
                                textcolor: Colors.white,
                                weight: FontWeight.bold,
                              )),
                            ],
                          ),
                        ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    CustomCard(
                                        card_action: (){},
                                        card_height: 50,
                                        card_content: Padding(
                                          padding: EdgeInsets.fromLTRB(25, 8, 25, 0),
                                        child: SmallText(
                                          textcolor: Colors.black,
                                          text: '420'+' kcal',
                                          weight: FontWeight.bold,
                                        )),
                                      ),
                                    CustomCard(
                                      card_action: (){},
                                      card_height: 50,
                                      card_content: Padding(
                                          padding: EdgeInsets.fromLTRB(25, 8, 25, 0),
                                          child: SmallText(
                                            textcolor: Colors.black,
                                            text: '1020'+' kcal',
                                            weight: FontWeight.bold,
                                          )),
                                    ),
        
        
                                  ],
                                ),
                              ),
                            ],
                          ),
              ),
            ),
            CustomCard(
                card_height: 550,
                card_action: (){},
                card_content: SizedBox(
                 height: 300,
                  child: ListView.builder(
                    itemCount: selected_items.length,
                      itemBuilder: (context , index){
                      _current_index = index;
                      return Padding(
                        padding: EdgeInsets.only(left: 20,top: 15,right: 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SubTitle(
                                    text: selected_items[_current_index],
                                    textcolor: Colors.black,
                                    weight: FontWeight.normal
                                ),
                                Spacer(flex: 1,),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.remove_circle_outlined,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SmallText(
                                    text: selected_items_grams[_current_index],
                                    textcolor: Colors.black,
                                    weight: FontWeight.normal
                                )
                              ],
                            )
                          ],)
                      );
                      }
                  )
            )
            )
          ],
        ),
      ),
    );
  }
}
