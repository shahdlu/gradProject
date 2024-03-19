import 'package:flutter/material.dart';
import 'package:gradproj/constants.dart';
import 'package:gradproj/search_field.dart';
import 'package:gradproj/widgets/calculate_button.dart';

import 'login.dart';






class Meals extends StatefulWidget{
  late int pageIndex;
  Meals({Key? myKey, required this.pageIndex}): super(key: myKey);

  @override
  State<Meals> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<Meals> {
  bool? isChecked = false;
  final List<String> breakfast_cardtitle =['French Toast','Egg and Vegetables','Yogurt and Fruits'];
  final List<String> breakfast_desc =['mix 1 egg ,1/4cup of\nskim milk,teaspoon of\nvanilla and 1/2\nteaspoon of cinnamon.\n'
      'soak 2 slides of toast\nin this mixture then\nfry the bread\nin the pan .',
    '2 slices of bread\n1 egg omeletvegetables\nsaladspoonful of cheese2\ntablespoon of avocado',
    'yogurt + seasonal\nfruits or honey\nor molasses'];
  final List<String> breakfast_image =['images/bread.png','images/egg.png','images/yogurt.png'];
  final List<String> breakfast_cal =['250','500','500'];

  final List<String> lunch_cardtitle =['Tuna Salad','Grilled Fish or Chicken','Legume soup and Salad'];
  final List<String> lunch_desc =['can of tuna +\nany vegetables you want.',
    'fish or chicken breast +\ngreen salad +\ntablespoon of rice.',
    'lentils or peas or\nbeans or any legume\nsoup + vegetables salad'];
  final List<String> lunch_image =['images/tunasalad.png','images/fish.png','images/soup.png'];
  final List<String> lunch_cal =['230','600','400'];


  final List<String> dinner_cardtitle =['Pizza','Yogurt and Fruits',''];
  final List<String> dinner_desc =['2 slices of pizza\n+ vegetables salad',
    'yogurt + seasonal\nfruits or honey\nor molasses',''];
  final List<String> dinner_image =['images/pizza.png','images/yogurt.png',''];
  final List<String> dinner_cal =['600','500',''];

  final List<String> snacks_cardtitle =['A handful of rawalmond','Dark Chocolate',''];
  final List<String> snacks_desc =['','2 cubes of chocolate\nwith 70% cocoa (100 g)',''];
  final List<String> snacks_image =['images/nuts.png','images/chocolate.png',''];
  final List<String> snacks_cal =['170','581',''];

  int _currentIndex =0;
  late int number_of_cards;
   late  String pagetitle;
  late  List<String> cardtitle;
  late  List<String> carddesc;
  late  List<String> cardimage;
  late  List<String> cardcal;
  List<bool> _isChecked = List<bool>.filled(3, false);
  @override
  Widget build(BuildContext context) {
    if(widget.pageIndex == 0 ){
      pagetitle ='Breakfast';
      number_of_cards = breakfast_cardtitle.length;
      cardtitle = breakfast_cardtitle;
      carddesc = breakfast_desc;
      cardimage = breakfast_image;
      cardcal = breakfast_cal;
    }
    else if(widget.pageIndex == 1 ){
      pagetitle ='Lunch';
      number_of_cards = lunch_cardtitle.length;
      cardtitle = lunch_cardtitle;
      carddesc = lunch_desc;
      cardimage = lunch_image;
      cardcal = lunch_cal;
    }
    else if(widget.pageIndex == 2 ){
      pagetitle ='Dinner';
      number_of_cards = dinner_cardtitle.length;
      cardtitle = dinner_cardtitle;
      carddesc = dinner_desc;
      cardimage = dinner_image;
      cardcal = dinner_cal;
    }
    else if(widget.pageIndex == 3 ){
      pagetitle ='Snacks';
      number_of_cards = snacks_cardtitle.length;
      cardtitle = snacks_cardtitle;
      carddesc = snacks_desc;
      cardimage = snacks_image;
      cardcal = snacks_cal;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          pagetitle,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body:  SingleChildScrollView(
      child: _MealsWidget(),

    ),
    );


  }
  Widget _MealsWidget(){
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                value: _isChecked[_currentIndex],
                activeColor: Color.fromRGBO(8, 97, 231, 1.0),
                onChanged: (newBool){
                  setState(() {
                    _isChecked[_currentIndex] = newBool!;
                  });
                }
            ),
                      Text(
                        cardtitle[_currentIndex],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                          carddesc[_currentIndex]
                      ),
                      Image.asset(cardimage[_currentIndex]),

                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Calories   ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        cardcal[_currentIndex]+'   cal',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )

                ],
              ),
            )),
        Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                          value: _isChecked[1],
                          activeColor: Color.fromRGBO(8, 97, 231, 1.0),
                          onChanged: (newBool){
                            setState(() {
                              _isChecked[1] = newBool!;
                            });
                          }
                      ),
                      Text(
                        cardtitle[1],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                          carddesc[1]
                      ),
                      Image.asset(cardimage[1]),

                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Calories   ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        cardcal[1]+'   cal',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )

                ],
              ),
            )),
        Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                          value: _isChecked[2],
                          activeColor: Color.fromRGBO(8, 97, 231, 1.0),
                          onChanged: (newBool){
                            setState(() {
                              _isChecked[2] = newBool!;
                            });
                          }
                      ),
                      Text(
                        cardtitle[2],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                          carddesc[2]
                      ),
                      Image.asset(cardimage[2]),

                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Calories   ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        cardcal[2]+'   cal',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )

                ],
              ),
            )),
         CalculateButton(
        title: 'Add another food',
        onTap: (){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (v)=> SearchField())
          );
        },
        buttonbackcolor: kButtonColor,
        buttontextcolor: Colors.white)
      ],
    );
  }
}