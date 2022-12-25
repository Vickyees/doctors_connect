import 'package:doctors_connect/screens/chat_screen.dart';
import 'package:doctors_connect/screens/doctor_list_screen.dart';
import 'package:doctors_connect/widgets/lobby_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../widgets/doctor_card.dart';
import '../widgets/category_card.dart';

class LobbyScreen extends StatelessWidget {
  static const routeName = "/lobby-screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // name
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello,',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Vignesh,',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  // profile picture
                  InkWell(
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                    },
                    child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.deepPurple[100],
                            borderRadius: BorderRadius.circular(12)),
                        child: Icon(Icons.person)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),

            // Chatbot button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.pink[100],
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      // animation or cute picture
                      Container(
                        height: 100,
                        width: 100,
                        child: Lottie.network(
                            'https://assets10.lottiefiles.com/packages/lf20_g7zx4ni5.json'),
                      ),
                      SizedBox(
                        width: 20,
                      ),

                      // how do you feel + get started button
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Don't have time to wait for the doctor?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              'Talk to the bot and clear your doubts!',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    ChatScreen.routeName,
                                    arguments: {'character': 'bot'});
                              },
                              child: Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[300],
                                    borderRadius: BorderRadius.circular(12)),
                                child: Center(
                                  child: Text(
                                    "Consult with bot",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            ),
            SizedBox(
              height: 20,
            ),

            // search bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.deepPurple[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      hintText: 'How can we help you?'),
                ),
              ),
            ),

            SizedBox(
              height: 15,
            ),

            //horizontal listview -> categories: dentist, surgeon, etc.,

            Container(
              height: 80,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                CategoryCard(
                  categoryName: 'Dentist',
                  iconImagePath: 'assets/icons/tooth.png',
                ),
                CategoryCard(
                  categoryName: 'Surgeon',
                  iconImagePath: 'assets/icons/surgeon.png',
                ),
                CategoryCard(
                  categoryName: 'Pharacist',
                  iconImagePath: 'assets/icons/pills.png',
                ),
              ]),
            ),
            SizedBox(
              height: 15,
            ),
            // doctor list
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Doctor list",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(DoctorsListScreen.routeName);
                    },
                    child: Text(
                      "See all",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),

            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  DoctorCard(
                    doctorImagePath: 'assets/images/doctor 1.jpg',
                    rating: '4.9',
                    doctorName: "Dr. Andus Huda MD",
                    doctorProfession: 'Therapist',
                  ),
                  DoctorCard(
                    doctorImagePath: 'assets/images/doctor 2.jpg',
                    rating: '4.4',
                    doctorName: "Dr. Albert Flores",
                    doctorProfession: 'Psychologist',
                  ),
                  DoctorCard(
                    doctorImagePath: 'assets/images/doctor 3.jpg',
                    rating: '5.0',
                    doctorName: "Dr. Varshini",
                    doctorProfession: 'Surgeon',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
