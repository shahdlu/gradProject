// import 'package:flutter/material.dart';
// import 'package:gradproj/widgets/calender.dart';
// import 'package:gradproj/widgets/cards.dart';

// import '../../theme/constants.dart';
// import '../../widgets/text.dart';

// class FoodReport extends StatefulWidget {
//   @override
//   _FoodReportState createState() => _FoodReportState();
// }

// class _FoodReportState extends State<FoodReport> {
//   int _currentIndex = 0;
//   DateTime selectedDate = DateTime.now();
//   List<String> meal_name = ['Breakfast','Lunch','Dinner','Snacks'];
//   List<String> breakfast_kind = ['egg','bread'];
//   List<String> lunch_kind = ['fish','rice'];
//   List<String> dinner_kind = ['pizza'];
//   List<String> snacks_kind = ['nuts'];
//   List<String> breakfast_kcal = ['100','200'];
//   List<String> lunch_kcal = ['150','200'];
//   List<String> dinner_kcal = ['300'];
//   List<String> snacks_kcal = ['100'];
//   late List<String> food_kind ;
//   late List<String> food_kcal ;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: TextTitle(
//             text: 'Food',
//             textcolor: Colors.black
//         ),
//       ),
//       body: _reportPageWidget(),
//     );

//   }
//   Widget _reportPageWidget(){
//     return Column(
//       children: [
//         Padding(
//           padding: EdgeInsets.fromLTRB(20, 30, 0, 20),
//           child: Row(
//               children: [
//                 SubTitle(
//                   text: 'select date',
//                   textcolor: Colors.black,
//                   weight: FontWeight.bold,
//                 ),
//                 Padding(
//                     padding: EdgeInsets.only(left: 0),
//                     child:  Calender(onDateChanged: (value) {

//                     },)
//                 ),
//               ]),
//         ),
//         Column(
//           children: [
//             SubTitle(
//                 text: 'Total',
//                 textcolor: Colors.black,
//                 weight: FontWeight.bold
//             ),
//             Padding(
//               padding: EdgeInsets.only(bottom: 25),
//               child: SmallText(
//                 text: '304.6'+' KCal',
//                 textcolor: Colors.red,
//                 weight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//         Expanded(
//           child: ListView.builder(
//               itemCount: 4,
//               itemBuilder: (context,index){
//                 _currentIndex = index;
//                 if(index == 0){
//                   food_kind = breakfast_kind ;
//                   food_kcal = breakfast_kcal;
//                 }else if(index == 1){
//                   food_kind = lunch_kind ;
//                   food_kcal = lunch_kcal;
//                 }else if(index == 2){
//                   food_kind = dinner_kind ;
//                   food_kcal = dinner_kcal;
//                 }else if(index == 3){
//                   food_kind = snacks_kind ;
//                   food_kcal = snacks_kcal;
//                 }
//                 return CustomCard(
//                   card_height: 300,
//                   card_action: (){},
//                   card_content: Column(
//                       children: [
//                         Padding(
//                             padding: EdgeInsets.fromLTRB(30, 20, 45, 0),
//                             child: Row(
//                                 children: [
//                                   SmallText(
//                                     text: meal_name[_currentIndex],
//                                     textcolor: Colors.black,
//                                     weight: FontWeight.bold,
//                                   ),
//                                   Spacer(flex: 1,),
//                                   SmallText(
//                                     text: 'KCal',
//                                     textcolor: Colors.black,
//                                     weight: FontWeight.bold,

//                                   ),
//                                 ]
//                             )),
//                         SizedBox(
//                             height: 250,
//                             child: ListView.builder(
//                                 itemCount: food_kind.length,
//                                 itemBuilder: (context,index) {
//                                   _currentIndex = index;
//                                   return Padding(
//                                       padding: EdgeInsets.fromLTRB(30, 10, 40, 0),
//                                       child: Row(
//                                         children: [
//                                           SmallText(
//                                             text: food_kind[_currentIndex],
//                                             textcolor: kButtonColor,
//                                             weight: FontWeight.bold,
//                                           ),
//                                           Spacer(flex: 1,),
//                                           SmallText(
//                                             text: food_kcal[_currentIndex],
//                                             textcolor: Colors.red,
//                                             weight: FontWeight.bold,
//                                           ),
//                                         ],
//                                       ));
//                                 } )),
//                       ]),
//                 );
//               }
//           ),
//         ),

//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gradproj/theme/constants.dart';
import '../../widgets/cards.dart';
import '../../widgets/text.dart';

class FoodReport extends StatefulWidget {
  const FoodReport({Key? key}) : super(key: key);

  @override
  _FoodReportState createState() => _FoodReportState();
}

class _FoodReportState extends State<FoodReport> {
  int _totalKcal = 0;

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      // Return a message or alternative UI if user is not logged in
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          title: const TextTitle(
            text: 'Food Report',
            textcolor: Colors.white,
          ),
        ),
        body: const Center(
          child: Text(
            'Please log in to view selected items',
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Food Report',
          style: TextStyle(color: Colors.black , fontSize: 20 , fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('selected_items')
                    .doc(userId)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  if (!snapshot.hasData || !snapshot.data!.exists) {
                    return const Center(child: Text('No selected items'));
                  }
                  var selectedItems =
                      List<Map<String, dynamic>>.from(snapshot.data!['items']);
                  _totalKcal = selectedItems.fold<int>(0, (total, item) {
                    final kcal = item['kcal'];
                    if (kcal is num) {
                      final kcalInt = int.tryParse(kcal.toString());
                      if (kcalInt != null) {
                        return total + kcalInt;
                      }
                    }
                    return total;
                  });

                  var userData = snapshot.data?.data() as Map<String, dynamic>;
                  bool isMale = userData['gender'] == 'male';
                  print(isMale);
                  num height = userData['height'] ?? 100;
                  num weight = userData['weight'] ?? 50;
                  num age = userData['age'] ?? 20;
                  var bmrMale = (10 * weight.toDouble()) +
                      (6.25 * height.toDouble()) -
                      (5 * age) +
                      5;
                  var bmrFemale = (10 * weight.toDouble()) +
                      (6.25 * height.toDouble()) -
                      (5 * age) -
                      161;
                  num bmr = isMale ? bmrMale : bmrFemale;
                  var remaining = bmr - _totalKcal;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                        child: SubTitle(
                          text: "Total",
                          textcolor: Colors.black,
                          weight: FontWeight.bold,
                        ),
                      ),
                      SubTitle(
                        text: '$_totalKcal kcal',
                        textcolor: Colors.black,
                        weight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      for (var item in selectedItems)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: Row(
                              children: [
                                SubTitle(
                                  text: item['name'],
                                  textcolor: Colors.black,
                                  weight: FontWeight.bold,
                                ),
                                const Spacer(),
                                // IconButton(
                                //   icon: const Icon(Icons.remove_circle_outlined),
                                //   onPressed: () {
                                //     _removeItemFromSelectedItems(userId, item);
                                //   },
                                // ),
                                SmallText(
                                  text: '${item['kcal']} kcal',
                                  textcolor: Colors.black,
                                  weight: FontWeight.normal,
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _removeItemFromSelectedItems(
      String userId, Map<String, dynamic> item) async {
    try {
      final docRef =
          FirebaseFirestore.instance.collection('selected_items').doc(userId);

      await docRef.update({
        'items': FieldValue.arrayRemove([item]),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Item removed from selected items')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to remove item: $e')),
      );
    }
  }
}
