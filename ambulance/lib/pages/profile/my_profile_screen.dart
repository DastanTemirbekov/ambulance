import 'dart:io';

import 'package:ambulance/const/ambulance_colors.dart';
import 'package:ambulance/const/ambulance_textstyle.dart';
import 'package:ambulance/models/user_model.dart';
import 'package:ambulance/pages/profile/widgets/tabs.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen>
    with TickerProviderStateMixin {
  ImagePicker imagePicker = ImagePicker();

  XFile? image;

  bool? isEmpty = true;

  late TabController tabController;

  void handleTabController() {
    setState(() {});
  }

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 3);

    tabController.addListener(handleTabController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: const Text('Мой профиль', style: AmbulanceTextStyle.sfW700S34),
          backgroundColor: AmbulanceColors.appBarColor,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: !isEmpty!
                        ? FileImage(File(image!.path))
                        : null, // если картинка с галереи не выбрана то ничего, если есть то ставит
                    backgroundColor: AmbulanceColors.avatarBackground,
                    radius: 50,
                    child: isEmpty!
                        ? Text(
                            // вытаскиваем первые буквы, если картинки нет
                            '${UserModel.name!.substring(0, 1).toUpperCase()}${UserModel.surname!.substring(0, 1).toUpperCase()}',
                            style: AmbulanceTextStyle.sfW500S40,
                          )
                        : null,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: AmbulanceColors.buttonColor,
                      child: IconButton(
                        icon: const Icon(
                          Icons.add_a_photo,
                          size: 16,
                        ),
                        onPressed: () async {
                          // добавление фото из галереи
                          image = await imagePicker.pickImage(
                              source: ImageSource.gallery);
                          isEmpty = false;
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                '${UserModel.name} ${UserModel.surname}',
                style: AmbulanceTextStyle.sfW500S22,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                '0 ${UserModel.phone}',
                style: AmbulanceTextStyle.sfW400S18,
              ),
              const SizedBox(
                height: 13,
              ),
              TabBar(
                controller: tabController,
                indicatorWeight: 3,
                indicatorColor: AmbulanceColors.buttonColor,
                labelColor: AmbulanceColors.buttonColor,
                unselectedLabelColor: AmbulanceColors.blueWithOpacity,
                tabs: [
                  Tab(
                    text: 'Анализы',
                    icon: Image.asset(
                      'assets/images/profile_tab1.png',
                      height: 24,
                      width: 24,
                      color: tabController.index == 0
                          ? AmbulanceColors.blue
                          : AmbulanceColors.blueWithOpacity,
                    ),
                  ),
                  Tab(
                    text: 'Анализы',
                    icon: Image.asset(
                      'assets/images/profile_tab2.png',
                      height: 24,
                      width: 24,
                      color: tabController.index == 1
                          ? AmbulanceColors.blue
                          : AmbulanceColors.blueWithOpacity,
                    ),
                  ),
                  Tab(
                    text: 'Анализы',
                    icon: Image.asset(
                      'assets/images/profile_tab3.png',
                      height: 24,
                      width: 24,
                      color: tabController.index == 2
                          ? AmbulanceColors.blue
                          : AmbulanceColors.blueWithOpacity,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TabBarView(
                    children: [
                      TabbarItems(
                        customImage: 'assets/images/analyzes.png',
                        isRecommends: false,
                        image: image,
                      ),
                      TabbarItems(
                        customImage: 'assets/images/diagnoses.png',
                        isRecommends: false,
                        image: image,
                      ),
                      TabbarItems(
                        customImage: 'assets/images/recommends.png',
                        image: image,
                        isRecommends: true,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TabbarItems extends StatefulWidget {
  TabbarItems(
      {Key? key,
      required this.customImage,
      required this.isRecommends,
      this.image})
      : super(key: key);
  final String customImage;
  final bool isRecommends;
  XFile? image;
  @override
  _TabbarItemsState createState() => _TabbarItemsState();
}

class _TabbarItemsState extends State<TabbarItems> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: widget.image ==
              null // если документ не выбран отрисует скрин как на фигме, а иначе то что снизу
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  widget.customImage,
                  height: 120,
                ),
                const SizedBox(
                  height: 22,
                ),
                const Text(
                  'У вас пока нет добавленных результатов анализов',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 22,
                ),
                widget.isRecommends ==
                        false // в скрине рекомендации не было возможности добавления документа, поэтому создали тру фолс, который передаем при вызове
                    ? TextButton.icon(
                        onPressed: () {
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: double.infinity,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, left: 20, right: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text('Анализы',
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w500)),
                                      const SizedBox(height: 20),
                                      const Text('Названия'),
                                      TextField(
                                        onChanged: (docName) {
                                          //   name = docName;
                                        },
                                        decoration: const InputDecoration(
                                            hintText:
                                                'Введите названия документа'),
                                      ),
                                      const SizedBox(height: 20),
                                      ElevatedButton(
                                          onPressed: () async {},
                                          child:
                                              const Text('Добавить документ')),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.add_a_photo),
                        label: const Text('Добавить документ'),
                      )
                    : const SizedBox(),
              ],
            )
          : Container(
              height: 100,
              color: Colors.red,
            ), // вместо него должен быть listview.Builder c элементами
    );
  }
}
