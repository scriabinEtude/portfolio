import 'package:portfolio/common/key.dart';
import 'package:portfolio/model/community.dart';
import 'package:portfolio/model/company.dart';
import 'package:portfolio/model/hire_me.dart';
import 'package:portfolio/model/indicators.dart';
import 'package:portfolio/model/intro.dart';
import 'package:portfolio/model/introduce.dart';
import 'package:portfolio/model/menu.dart';
import 'package:portfolio/model/project.dart';
import 'package:portfolio/model/pubdev.dart';
import 'package:portfolio/model/skill.dart';
import 'package:portfolio/model/skill_category.dart';

class DataSet {
  List<Menu> menus;
  final Indicators indicators;
  final Intro intro;
  final List<Company> companies;
  final List<Introduce> introduces;
  final List<SkillCategory> skills;
  final List<Pubdev> pubdevs;
  final HireMe contact;

  DataSet({
    required this.menus,
    required this.indicators,
    required this.intro,
    required this.companies,
    required this.introduces,
    required this.skills,
    required this.pubdevs,
    required this.contact,
  });

  List<Project> get projects {
    List<Project> results = [];
    for (var c in companies) {
      results.addAll(c.projectWithCompany);
    }
    return results;
  }
}

final dataSetKor = DataSet(
    menus: [
      Menu(
        title: '홈',
        pathName: 'home',
        scrollKey: Keys.menuHomeKey,
      ),
      Menu(
        title: '자기소개',
        pathName: 'introduce',
        scrollKey: Keys.menuIntroduceKey,
      ),
      Menu(
        title: '프로젝트',
        pathName: 'project',
        scrollKey: Keys.menuProjectKey,
      ),
      Menu(
        title: '보유 기술',
        pathName: 'skill',
        scrollKey: Keys.menuSkillKey,
      ),
      // Menu(title: '평가', pathName: 'talk'),
      // Menu(title: '이력', pathName: 'resume'),
      Menu(
        title: 'pub.dev',
        pathName: 'pubdev',
        scrollKey: Keys.menuPubdevKey,
      ),
      // Menu(title: '블로그', pathName: 'blog'),
      Menu(
        title: '고용하기',
        pathName: 'hire',
        type: MenuButtonType.button,
        scrollKey: Keys.menuHireMeKey,
      ),
    ],
    indicators: Indicators(
      birth: DateTime(1993, 4, 4),
      since: DateTime(2019, 6, 1),
      communities: 2,
      projectCount: 3,
    ),
    intro: Intro(
      title: "안녕하세요\nFlutter 개발자 임한결 입니다",
      subtitle:
          """책임감과 열정으로 서비스를 만듭니다. 끊임없는 아키텍쳐에 대한 고민, 지속적인 리팩토링으로 제품을 유연하고 확장 가능하게 만들때 보람을 느낍니다.""",
      image: 'assets/images/me.png',
    ),
    companies: [
      Company(
        title: '(주) 그랫',
        logo: 'assets/images/logo_grat.png',
        startDate: DateTime(2022, 03, 01),
        endDate: DateTime(2023, 04, 15),
        description: 'Seed 투자유치를 받은 반려동물 플랫폼 스타트업',
        position: WorkPosition.flutterFrontEnd,
        projects: [
          Project(
            title: "그랫 - 펫택시",
            sampleImages: [
              'assets/images/grat_home.png',
              'assets/images/grat_location.webp',
              'assets/images/grat_summary.webp',
              'assets/images/grat_gallery.webp',
              'assets/images/grat_membership.webp'
            ],
            devEnvs: [
              DevEnv.flutter,
              DevEnv.vscode,
              DevEnv.git,
              DevEnv.github,
              DevEnv.slack,
              DevEnv.notion,
              DevEnv.zeplin,
            ],
            functions: [
              "택시 예약 및 실시간 위치 확인 서비스",
              "1 : 1 영상통화 서비스",
              "의료상품 이커머스 및 결제 서비스",
              "Flutter Web 배포",
              "버전 관리 및 배포",
              "프로모션용 팝업, 웹뷰, 서비스",
              "별점 및 리뷰 서비스",
              "구글 애널리틱스 적용",
            ],
            achievements: [
              "회원수 백단위에서 만단위까지 매달 30%의 신규 유저 증가",
              "주요 반려동물 서비스들과 제휴 체결\n(삼성화재 오모오모, 레미안 아파트, 강아지 유치원 등)",
              "칸반보드 등의 애자일 방법론 도입",
              "Pub.dev에 자체 라이브러리 배포",
              "레거시 코드 리팩토링",
            ],
          ),
          Project(
            title: "그랫 - 동물병원용",
            sampleImages: [
              'assets/images/gratvet_main.png',
              'assets/images/gratvet_reserve.png',
              'assets/images/gratvet_schedule.png',
            ],
            devEnvs: [
              DevEnv.flutter,
              DevEnv.vscode,
              DevEnv.git,
              DevEnv.github,
              DevEnv.slack,
              DevEnv.notion,
              DevEnv.zeplin,
            ],
            functions: [
              "초기 기획 및 설계, 앱 등록부터 신규 기능개발까지 전 개발과정 참여",
              "1 : 1 영상통화 서비스",
              "병원용 캘린더 및 스케쥴 관리 서비스",
              "직원 권한관리",
              "진료시간 및 병원 정보 관리",
            ],
            achievements: [],
          ),
          Project(
            title: "그랫 - 드라이버용",
            sampleImages: [
              'assets/images/gratdriver_login.webp',
              'assets/images/gratdriver_shifty.webp',
              'assets/images/gratdriver_list.webp',
              'assets/images/gratdriver_detail.webp',
            ],
            devEnvs: [
              DevEnv.flutter,
              DevEnv.vscode,
              DevEnv.git,
              DevEnv.github,
              DevEnv.slack,
              DevEnv.notion,
              DevEnv.zeplin,
            ],
            functions: [
              "초기 기획 및 설계, 앱 등록부터 신규 기능개발까지 전 개발과정 참여",
              "택시 드라이버 스케쥴 확인 서비스",
              "택시 실시간 위치 백그라운드 트래킹",
              "외부 앱 연동 (Tmap)",
              "다중 파일 업로드",
              "관리자 기능 추가",
            ],
            achievements: [
              "개발 리딩 경험",
              "TestFlight 자동 배포 시스템 구축",
            ],
          ),
        ],
      ),
      Company(
        title: '(주) 이엘온소프트',
        logo: 'assets/images/logo_elonsoft.png',
        startDate: DateTime(2019, 06, 01),
        endDate: DateTime(2021, 10, 30),
        description: '금융 컴플라이언스 분야에 컨설팅, 솔루션 및 클라우드 플랫폼 서비스를 제공하는 전문 금융 플랫폼 기업',
        position: WorkPosition.javaBackEnd,
        projects: [
          Project(
            title: "폭스바겐파이낸셜코리아 (VWFSK)",
            sampleImages: ["assets/images/logo_java.png"],
            devEnvs: [
              DevEnv.java,
              DevEnv.spring,
              DevEnv.jsp,
              DevEnv.svn,
              DevEnv.outlook,
              DevEnv.tomcat,
              DevEnv.oracle,
            ],
            functions: [
              "AML (자금세탁방지 솔루션) 배포 및 커스터마이징",
              "검색 알고리즘 최적화 (Levenshtein distance, Lucene)",
              "Linux 환경에 솔루션 배포 및 관리",
              "Procedure 커스터마이징",
              "패스워드 생성 알고리즘 제작",
            ],
            achievements: [],
          ),
          Project(
            title: "11번가",
            sampleImages: ["assets/images/logo_java.png"],
            devEnvs: [
              DevEnv.java,
              DevEnv.spring,
              DevEnv.springBoot,
              DevEnv.jpa,
              DevEnv.git,
              DevEnv.gitlab,
              DevEnv.mysql,
              DevEnv.slack,
            ],
            functions: [
              "AML 솔루션 배포 및 11번가 사내 시스템 연동",
              "SSO 연동",
              "로그 시스템 연동",
              "대용량 엑셀 업로드 Threading",
              "로드밸런싱 서버 배포 경험 (라운드 로빈)",
            ],
            achievements: [],
          ),
        ],
      ),
    ],
    introduces: [
      Introduce(
          title: "아키텍쳐에 대한 고민",
          introduce:
              """요구사항은 빈번하게 발생되고 변경됩니다. 이를 발빠르게 대응하기 위해서 결합도가 낮고 모듈성이 높은 아키텍처로 개발하는 것을 추구합니다. 공통 UI 컴포넌트, 페이지네이터, 쿠폰 및 포인트 적용과 같은 기능까지 모듈화함으로써 비즈니스 로직에 집중할 수 있는 환경을 만들었습니다. 최근에는 이벤트 리스너까지 모듈화한 경험이 있습니다. 상태관리 클래스들의 시간 초과 이벤트를 받는 이벤트 리스너를 제네릭하게 구현했습니다. 덕분에 거의 템플릿 코드처럼 여겨지던 이벤트 리스너 작성 행위를 최소화 하여 업무 효율을 이끌어 냈습니다. 

모듈화할 때는 SOLID 원칙, 디자인 패턴을 적용하려고 노력합니다. 이미 익숙한 개념들을 차용한 설계는 협업이 용이하다고 생각합니다. 의사소통이 빠르며 모두의 동의를 이끌어내기 쉽기 때문입니다."""),
      Introduce(
        title: "주도적인 사내 업무환경 개선",
        introduce:
            "반복적인 사내 업무를 자동화할 수 있다면 주도적으로 개발해서 개선합니다.\n\n디바이스 별로 이미지를 분류를 자동화 해주는 스크립트를 개발해서 업무 효율성을 높였습니다. 수기로 진행하던 작업을 이미지 파일명의 접미사를 구분하여 디바이스 별로 자동 분류되도록 개선했습니다. \n\nCI / CD 프로세스를 서비스에 적용했습니다. 기존에는 수동 배포로 진행하던 배포 프로세스를 gitAction, fastlane, match를 사용하여 회사 제품 중 하나를 IOS 테스트플라이트로 자동 배포에 성공했습니다. \n\n메일링 시스템을 만들었습니다. 정기적으로 각 고객사마다 데이터를 보내는 업무가 있었는데 고객사마다 데이터 형식이 달라 거의 하루가 소요되었습니다. 이에 프로그램을 만들고 작업 스케쥴러에 등록했습니다. 회사에서 실용성을 인정받아 개발직군 인원을 대상으로 프로그램을 소개하고 교육했습니다.\n\n웹 크롤러를 만들었습니다. 사내에서 사용하고 있는 웹 크롤러는 python 언어의 오픈소스였고, 오픈소스의 업데이트가 더 이상 지속되지 않자 경쟁업체보다 데이터량이 떨어지기 시작했습니다. 이에 typescript node로 자체 웹 크롤러를 제작하였습니다. 이는 국내 WatchList 웹 크롤러 중 가장 데이터가 많습니다(2021-09). 관련 업체에서 진행한 데이터 비교 보고서에서 제 크롤러가 가장 데이터량이 많았습니다.",
      ),
      Introduce(
        title: "효율적인 개발 방법론 추구",
        introduce:
            """초기 단계의 스타트업 구성원으로서 여러가지 방법론을 시도해볼 수 있는 좋은 기회가 주어졌습니다. 첫 서비스의 오픈까지는 워터폴 방식으로 팀이 운영되었습니다. 예정 서비스 오픈일까지의 일정 계획과 서로의 작업 진행도 체크가 중요하였기 때문에 IA 명세서를 도입하였습니다. 각자의 역할과 역량에 따라 작업분담을 구체적이게 계획할 수 있었고 진행도를 한눈에 파악할 수 있었습니다.

서비스가 배포되고 운영되는 과정에서 백로그가 쌓여감에 따라 애자일 방법론의 필요성이 대두되었습니다. 저희는 PO나 SM이 없었기 때문에 백로그의 우선순위를 매기는 작업은 모두 함께 진행했습니다. 애자일 방법론을 도입하고 가장 효과가 좋았던 두가지는, 첫째로 스크럼 구성요소 중 하나인 데일리 미팅입니다. 각자 당일 업무를 공유함으로써 하루 일과가 구체적으로 설정되었습니다. 두번째는 칸반보드입니다. 소수인원으로 앱 기능개발과 유지보수를 동시에 처리하더라도 각 요구사항의 진척도와 TODO 리스트를 명확하게 파악할 수 있습니다.

결과로 저희는 한 해에 3개의 앱을 출시할 수 있었습니다. 업무 효율성을 위해 모두가 노력한 결과입니다.""",
      )
    ],
    skills: [
      SkillCategory(
        title: "Flutter, Dart",
        percent: 0.9,
        details: [
          Skill.cleanArchitecture,
          Skill.mvvm,
          Skill.flutterWebApp,
          Skill.socket,
          Skill.webrtc,
          Skill.ga,
          Skill.dynamicLinks,
          Skill.fcm,
          Skill.socialLogin,
          Skill.tossPayments,
          Skill.danal,
          Skill.location,
          Skill.map,
          Skill.webview,
          Skill.bloc,
          Skill.cubit,
          Skill.provider,
          Skill.freezed,
          Skill.di,
          Skill.deploy,
          Skill.goRouter,
          Skill.retrofit,
        ],
      ),
      SkillCategory(
        title: "Communications",
        percent: 0.8,
        details: [
          Skill.github,
          Skill.gitAction,
          Skill.gitLab,
          Skill.slack,
          Skill.notion,
          Skill.zeplin,
          Skill.vscode,
          Skill.androidStudio,
        ],
      ),
      SkillCategory(
        title: "Java, RDBMS, AWS",
        percent: 0.65,
        details: [
          Skill.mvp,
          Skill.spring,
          Skill.springBoot,
          Skill.jpa,
          Skill.mybatis,
          Skill.jsp,
          Skill.tomcat,
          Skill.plsql,
          Skill.oracle,
          Skill.mysql,
          Skill.linux,
          Skill.ec2,
          Skill.s3,
          Skill.rds,
          Skill.lightSail,
          Skill.lucene,
        ],
      ),
      SkillCategory(
        title: "Others",
        percent: 0.5,
        details: [
          Skill.html,
          Skill.css,
          Skill.javascript,
          Skill.typescript,
          Skill.node,
        ],
      ),
    ],
    pubdevs: [
      Pubdev(
        title: "html_view",
        preview:
            "rendering .html file on Web Platform. To support Web and App within a single flutter project, the dart:html package must be imported.",
        link: "https://pub.dev/packages/html_view",
        type: PackageType.flutter,
      ),
      Pubdev(
        title: "hangyeol_channel",
        preview: "Easy channel connect implementation util",
        link: "https://pub.dev/packages/hangyeol_channel",
        type: PackageType.flutter,
      ),
    ],
    contact: HireMe(
      title: "HIRE ME",
      description: "긍정적인 커뮤니케이션, 새로운 도전을 통해 Flutter 기술로 서비스를 만들 준비가 되어 있습니다.",
      communities: [
        Community(
          title: 'scriabinetude87',
          url: null,
          imagePath: "assets/images/logo_gmail_320.png",
        ),
        Community(
          title: 'github',
          url: "https://github.com/scriabinEtude",
          imagePath: "assets/images/logo_github.png",
        ),
      ],
    ));
