import 'package:ambulance/const/ambulance_colors.dart';
import 'package:ambulance/const/ambulance_textstyle.dart';
import 'package:ambulance/const/widgets/ambulance_button.dart';
import 'package:ambulance/pages/profile/widgets/profile_content.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  void onPressLogIn(BuildContext context) {
    Navigator.pushNamed(context, '/profile/phone_number');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.5,
        backgroundColor: AmbulanceColors.appBarColor,
        title: const Text('Профиль', style: AmbulanceTextStyle.sfW600S17),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 2),
            const Text(
              'Зачем нужен профиль?',
              style: AmbulanceTextStyle.sfW500S22,
            ),
            const SizedBox(height: 25),
            const ProfileContent(
              icon: 'profile_hospital.png',
              title: 'Записывайтесь на прием к самым лучшим специалистам',
            ),
            const SizedBox(height: 30),
            const ProfileContent(
              icon: 'profile_note.png',
              title:
                  'Сохраняйте результаты ваших анализов, диагнозы и рекомендации от врачей в собственную библиотеку',
            ),
            const SizedBox(height: 30),
            const ProfileContent(
              icon: 'profile_comment.png',
              title:
                  'Просматривайте отзывы о врачах и дополняйте собственными комментариями',
            ),
            const SizedBox(height: 30),
            const ProfileContent(
              icon: 'profile_ring.png',
              title:
                  'Получайте уведомления о приеме или о поступивших сообщениях',
            ),
            const SizedBox(height: 20),
            AmbulanceButton(
                text: 'Войти', onPressed: () => onPressLogIn(context))
          ],
        ),
      ),
    );
  }
}
