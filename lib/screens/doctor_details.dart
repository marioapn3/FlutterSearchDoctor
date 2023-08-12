import 'package:flutter/material.dart';
import 'package:flutter_search_doctor/components/button.dart';
import 'package:flutter_search_doctor/components/custom_appbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/config.dart';

class DoctorDetail extends StatefulWidget {
  const DoctorDetail({super.key});

  @override
  State<DoctorDetail> createState() => _DoctorDetailState();
}

class _DoctorDetailState extends State<DoctorDetail> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: 'Doctor Details',
        icon: const FaIcon(Icons.arrow_back_ios),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFav = !isFav;
              });
            },
            icon: FaIcon(
              isFav ? Icons.favorite_rounded : Icons.favorite_outline,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          AboutDoctor(),
          DetailBody(),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Button(
              width: double.infinity,
              title: 'Book Appointment',
              disable: false,
              onPressed: () {
                Navigator.of(context).pushNamed('booking_page');
              },
            ),
          )
        ],
      )),
    );
  }
}

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      width: double.infinity,
      child: Column(children: [
        const CircleAvatar(
          radius: 65.0,
          backgroundImage: AssetImage('assets/doctor_2.jpg'),
          backgroundColor: Colors.white,
        ),
        Config.spaceMedium,
        const Text(
          'Dr Richard Tan',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Config.spaceSmall,
        SizedBox(
          width: Config.widthSize * 0.75,
          child: const Text(
            'S1 Kedoktoroan di Universitas Dian Nuswantoro Semarang   \n S2 Spesialis Jantung di Universitas Diponegoro Semarang',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ),
        Config.spaceSmall,
        SizedBox(
          width: Config.widthSize * 0.75,
          child: const Text(
            'Rumah Sakit Telogorjo Semarang',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ),
      ]),
    );
  }
}

class DetailBody extends StatelessWidget {
  const DetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Config.spaceSmall,
          //Pengalaman doctor, pasien dan rating
          const DoctorInfo(),
          Config.spaceSmall,
          const Text(
            'About Doctor',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          Config.spaceSmall,
          const Text(
            'Dr. Richard Tan is an experience Dentist at Indonesia. He is graduated since 2008 and completed his training at Dian Nuswantoro Unviersity',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
            softWrap: true,
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}

//menggunakan component card menjadi 3 di satu row5
class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        InfoCard(
          label: 'Patient',
          value: '109',
        ),
        SizedBox(
          width: 15,
        ),
        InfoCard(
          label: 'Experience',
          value: '10 Years',
        ),
        SizedBox(
          width: 15,
        ),
        InfoCard(
          label: 'Rating',
          value: '4.6',
        )
      ],
    );
  }
}

//component info card
class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.label, required this.value});

  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Config.primaryColor,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 15,
        ),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
