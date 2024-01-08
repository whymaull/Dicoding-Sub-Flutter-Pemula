import 'package:flutter/material.dart';
import 'package:sub_flutter_pemula/motor.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.place});
  final Motor place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(
          place.merk,
          textAlign: TextAlign.center,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                DetailMotor(place: place),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetailMotor extends StatelessWidget {
  const DetailMotor({super.key, required this.place});
  final Motor place;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          decoration: BoxDecoration(
            color: Colors.amber[50],
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(place.img),
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          place.model,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          place.year,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              place.desc,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ],
    );
  }
}
