import 'package:flutter/material.dart';

import '../utils/config.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key, required this.route});

  final String route;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      height: 150,
      child: GestureDetector(
        child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          elevation: 5,
          color: Colors.white,
          child: Row(
            children: [
              SizedBox(
                  width: Config.widthSize * 0.24,
                  child: Image.asset('assets/doctor_2.jpg')),
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Dr Richard Tan',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Dental',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(
                          Icons.star_border,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Text('4.5'),
                        Spacer(
                          flex: 1,
                        ),
                        Text('Reviews'),
                        Spacer(
                          flex: 1,
                        ),
                        Text('(20)')
                      ],
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
        onTap: () {
          //redirect to doctor detail
          Navigator.of(context).pushNamed(route);
        },
      ),
    );
  }
}
