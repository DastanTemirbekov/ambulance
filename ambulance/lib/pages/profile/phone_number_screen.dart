import 'package:ambulance/const/ambulance_colors.dart';
import 'package:ambulance/const/ambulance_textstyle.dart';
import 'package:ambulance/const/widgets/ambulance_button.dart';
import 'package:ambulance/models/user_model.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
   final controller = MaskedTextController(mask: '(000)-000-000'); // маска ввода номера телефона
  void onPressLogIn(BuildContext context) {
    UserModel.phone = controller.text; // записываем данные с контроллера в созданный нами класс(моделька)
    Navigator.pushNamed(context, '/profile/phone_number/pin_code_screen');
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        elevation: 1.5,
        title: const Text('Вход', style: AmbulanceTextStyle.sfW600S17),
        backgroundColor: AmbulanceColors.appBarColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close, color: AmbulanceColors.blackWithOpacity),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Войти',
              style: AmbulanceTextStyle.sfW700S34,
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Номер телефона',
              style: AmbulanceTextStyle.sfW400S15,
            ),
            const SizedBox(height: 12),
             TextField(
              controller: controller,
              decoration: const InputDecoration(
                prefix: Text(
                  '0 ',
                  style: AmbulanceTextStyle.sfW600S17,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'На указанный вами номер придет однократное СМС-сообщение с кодом подтверждения.',
              style: AmbulanceTextStyle.sfW400S15,
            ),
            const Spacer(),
            AmbulanceButton(
              text: 'Далее',
              onPressed: () => onPressLogIn(context),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
