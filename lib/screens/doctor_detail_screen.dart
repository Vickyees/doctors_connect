import 'package:doctors_connect/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class DoctorDetailScreen extends StatelessWidget {
  static const routeName = "/doctor-detail-screen";
  @override
  Widget build(BuildContext context) {
    final doctor =
        ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.chat_bubble),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.call),
              ),
            ],
            // backgroundColor: Colors.deepPurple[100],
            backgroundColor: Colors.pink[100],
            expandedHeight: 450, // image height
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              // title: Text(doctor['name'] ?? 'doctor_name'),
              background: Hero(
                tag: doctor['name'] ?? '',
                child: Image.asset(
                  doctor['image'] ?? '',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, left: 25.0),
                  child: Text(
                    doctor['name'] ?? 'doctor_name',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.medical_services,
                            color: Colors.lightBlue,
                            size: 18,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            doctor['profession'] ?? '',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[500],
                                fontSize: 16),
                            softWrap: true,
                          ),
                        ],
                      ),
                      Chip(
                          backgroundColor: Color.fromARGB(255, 42, 94, 136),
                          label: Text(
                            "₹ 1200/h",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.people,
                            color: Colors.grey[700],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "500+",
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.work,
                            color: Colors.grey[700],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "7 Years",
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "4.7",
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, top: 25.0),
                  child: Text(
                    "Available Time",
                    style: TextStyle(
                        color: Color.fromARGB(255, 94, 95, 133),
                        fontWeight: FontWeight.bold,
                        fontSize: 19),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25.0, top: 25.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Mon",
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold,
                                fontSize: 19),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Sat",
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold,
                                fontSize: 19),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Sun",
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold,
                                fontSize: 19),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, top: 50.0),
                  child: Text(
                    "Description",
                    style: TextStyle(
                        color: Color.fromARGB(255, 94, 95, 133),
                        fontWeight: FontWeight.bold,
                        fontSize: 19),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, top: 25.0, right: 25.0),
                  child: Text(
                    "A psychologist is someone who studies the mind and behavior. While people often think of talk therapy when they hear the word psychologist, this profession actually encompasses a wide range of specialty areas, including such things as animal research and organizational behavior.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 140, 141, 164),
                        fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 25.0, left: 25.0, right: 25.0, bottom: 10),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.video_call_rounded,
                            color: Colors.white,
                            size: 28,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Video Consult",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.blue),
                      onPressed: () {
                        Navigator.of(context).pushNamed(ChatScreen.routeName,
                            arguments: {
                              'character': 'doctor',
                              'name': doctor['name']
                            });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.chat_bubble,
                            color: Colors.white,
                            size: 28,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Chat Consult",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
