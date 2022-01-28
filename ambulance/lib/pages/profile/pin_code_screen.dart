import 'package:ambulance/const/ambulance_colors.dart';
import 'package:ambulance/const/ambulance_textstyle.dart';
import 'package:ambulance/const/widgets/ambulance_button.dart';
import 'package:ambulance/pages/profile/add_user_info_screen.dart';
import 'package:flutter/material.dart';

class PinCodeScreen extends StatefulWidget {
  const PinCodeScreen({Key? key}) : super(key: key);

  @override
  State<PinCodeScreen> createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.5,
        title: const Text('Подтверждение номера',
            style: AmbulanceTextStyle.sfW600S17),
        backgroundColor: AmbulanceColors.appBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                'Введите код из смс',
                style: AmbulanceTextStyle.sfW500S22,
              ),
            ),
            const SizedBox(
              height: 140,
            ),
            TextField(
              obscureText: true,
              maxLength: 4,
              decoration: InputDecoration(
                counterText: '',
                prefix: const Text(
                  'Код',
                  style: AmbulanceTextStyle.sfW600S17,
                ),
                suffixIcon: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.remove_red_eye)),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.black),
                ),
              ),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Получить код повторно',
                ),
              ),
            ),
            const Spacer(),
            AmbulanceButton(
              text: 'Далее',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddUserInfo(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
