import 'package:flutter/material.dart';
import '../screens/doctor_detail_screen.dart';

class DoctorCard extends StatelessWidget {
  final String? doctorImagePath;
  final String? rating;
  final String? doctorName;
  final String? doctorProfession;

  DoctorCard({
    @required this.doctorImagePath,
    @required this.rating,
    @required this.doctorName,
    @required this.doctorProfession,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(DoctorDetailScreen.routeName, arguments: {
          'name': doctorName,
          'rating': rating,
          'profession': doctorProfession,
          'image': doctorImagePath
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.deepPurple[100],
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            //Picture of the doctor
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Hero(
                  tag: doctorName ?? '',
                  child: Image.asset(
                    doctorImagePath.toString(),
                    height: 80,
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              //rating
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow[600],
                  ),
                  Text(
                    rating.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              // doctor name
              Text(
                doctorName.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 5),
              // doctor title
              Text("${doctorProfession.toString()}, 7 y.e"),
            ],
          ),
        ),
      ),
    );
  }
}
