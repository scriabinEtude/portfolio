import 'package:flutter/material.dart';
import 'package:portfolio/common/dataset.dart';
import 'package:portfolio/common/key.dart';
import 'package:portfolio/screen/app_bar.dart';
import 'package:portfolio/screen/contact/contact_widget.dart';
import 'package:portfolio/screen/header/components/app_drawer.dart';
import 'package:portfolio/screen/intro/intro_widget.dart';
import 'package:portfolio/screen/introduce/introduce_widget.dart';
import 'package:portfolio/screen/project/project_widget.dart';
import 'package:portfolio/screen/pubdev/pubdev_wdiget.dart';
import 'package:portfolio/screen/skill/skill_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.dataSet,
  });

  final DataSet dataSet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Keys.scaffoldKey,
      endDrawer: AppDrawer(
        menus: dataSet.menus,
      ),
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
            menus: dataSet.menus,
          ),
          IntroWidget(
            scrollKey: Keys.menuHomeKey,
            intro: dataSet.intro,
            indicators: dataSet.indicators,
          ),
          IntroduceWidget(
            scrollKey: Keys.menuIntroduceKey,
            introduces: dataSet.introduces,
          ),
          ProjectWidget(
            scrollKey: Keys.menuProjectKey,
            projects: dataSet.projects,
          ),
          SkillWidget(
            scrollKey: Keys.menuSkillKey,
            skills: dataSet.skills,
          ),
          PubdevWidget(
            scrollKey: Keys.menuPubdevKey,
            pubdevs: dataSet.pubdevs,
          ),
          ContactWidget(
            scrollKey: Keys.menuHireMeKey,
            hireMe: dataSet.contact,
          ),
        ],
      ),
    );
  }
}
