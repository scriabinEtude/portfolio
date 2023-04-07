import 'package:portfolio/model/company.dart';
import 'package:portfolio/model/contribution.dart';
import 'package:portfolio/model/store_url.dart';
import 'package:portfolio/util/term.dart';

class Project {
  final String title;
  final Term? term;
  final List<String> sampleImages;
  final List<DevEnv> devEnvs;
  final List<String> functions;
  final List<String> achievements;
  Company? company;
  final Contribution? contribution;
  final StoreUrl? storeUrl;

  Project({
    required this.title,
    this.term,
    required this.sampleImages,
    required this.devEnvs,
    required this.functions,
    required this.achievements,
    this.company,
    this.contribution,
    this.storeUrl,
  });

  String get devEnvStrnig => devEnvs.map((d) => d.title).join(", ");
  bool get isStoreUrl => storeUrl != null;
  bool get isTerm => term != null;
}

enum DevEnv {
  flutter('Flutter'),
  vscode('Vscode'),
  java('Java'),
  spring('Spring'),
  springBoot("Spring Boot"),
  jsp('Jsp'),
  myBatis('MyBatis'),
  plsql('PL/SQL'),
  procedure('Procedure'),
  tomcat('Tomcat'),
  git('Git'),
  github('Git-Hub'),
  gitlab('Git-Lab'),
  svn('Svn'),
  slack('Slack'),
  outlook('Outlook'),
  notion('Notion'),
  zeplin('Zeplin'),
  jpa('JPA'),
  oracle("Oracle"),
  mysql("Mysql"),
  springBatch('Spring Batch');

  final String title;
  const DevEnv(this.title);
}
