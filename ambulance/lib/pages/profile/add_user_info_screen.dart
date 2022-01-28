import 'package:ambulance/const/ambulance_colors.dart';
import 'package:ambulance/const/ambulance_textstyle.dart';
import 'package:ambulance/const/widgets/ambulance_button.dart';
import 'package:ambulance/models/user_model.dart';
import 'package:ambulance/pages/profile/my_profile_screen.dart';
import 'package:flutter/material.dart';

class AddUserInfo extends StatefulWidget {
  const AddUserInfo({Key? key}) : super(key: key);

  @override
  _AddUserInfoState createState() => _AddUserInfoState();
}

class _AddUserInfoState extends State<AddUserInfo> {
  TextEditingController nameController = TextEditingController(); // контроллеры для текстфилда
  TextEditingController surnameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.5,
        title:
            const Text('Создание профиля', style: AmbulanceTextStyle.sfW600S17),
        backgroundColor: AmbulanceColors.appBarColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close, color: AmbulanceColors.blackWithOpacity),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 32),
            const Text(
              'Имя',
              style: AmbulanceTextStyle.sfW400S15,
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Фамилия',
              style: AmbulanceTextStyle.sfW400S15,
            ),
            TextField(
              controller: surnameController,
              decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.black),
                ),
              ),
            ),
            const Spacer(),
            AmbulanceButton(
              text: 'Далее',
              onPressed: () {
                UserModel.name = nameController.text; // записываем в класс имя пользователя
                UserModel.surname = surnameController.text; // записываем в класс фамилию пользователя

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyProfileScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
