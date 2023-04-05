enum Skill {
  // flutter, dart
  cleanArchitecture("Clean Architecture", true),
  mvvm("MVVM", true),
  flutterWebApp("Flutter Web App", true),
  socket("Socket", true),
  webrtc("WebRTC", true),
  ga("Google Analytics", true),
  dynamicLinks("Dynamic Links", true),
  fcm("Fcm", true),
  socialLogin("Social Login", true),
  tossPayments("Toss Payments", true),
  danal("Danal 본인인증", true),
  location("Location", true),
  map("Map", true),
  webview("Webview", true),
  bloc("Bloc", true),
  cubit("Cubit", true),
  provider("Provider", false),
  freezed("Freezed", true),
  di("DI", true),
  deploy("배포 관리", true),
  goRouter("goRouter", false),
  retrofit("retrofit", false),

  // communication
  github("GitHub", true),
  gitAction("GitAction", true),
  gitLab("GitLab", false),
  slack("Slack", true),
  notion("Notion", true),
  zeplin("Zeplin", true),
  vscode("Vscode", true),
  androidStudio("Android Studio", false),

  // java
  mvp("MVP", true),
  spring("Spring", true),
  springBoot("Spring Boot", true),
  jpa("JPA", true),
  mybatis("Mybatis", true),
  jsp("JSP", true),
  tomcat("Tomcat", true),
  plsql("PL/SQL", true),
  oracle("Oracle", true),
  mysql("MySql", true),
  linux("Linux", true),
  ec2("EC2", true),
  s3("S3", true),
  rds("RDS", true),
  lightSail("LightSail", false),
  lucene("Lucene", true),

  // others
  html("html", false),
  css('css', false),
  javascript("Javascript", true),
  typescript("Typescript", false),
  node("node", true);

  final String title;
  final bool isMain;

  const Skill(this.title, this.isMain);
}
