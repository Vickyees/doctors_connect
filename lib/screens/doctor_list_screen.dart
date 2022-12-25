import 'package:flutter/material.dart';
import '../widgets/doctor_card.dart';

class DoctorsListScreen extends StatelessWidget {
  static const routeName = "/doctors-list-screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctors"),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      backgroundColor: Color.fromARGB(255, 240, 235, 241),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            DoctorCard(),
            DoctorCard(),
            DoctorCard(),
            DoctorCard(),
            DoctorCard(),
            DoctorCard(),
            DoctorCard(),
            DoctorCard(),
          ],
        ),
      ),
    );
  }
}
