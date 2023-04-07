import 'package:flutter/material.dart';
import 'package:portfolio/common/key.dart';
import 'package:portfolio/model/company.dart';
import 'package:portfolio/model/project.dart';
import 'package:portfolio/model/store_url.dart';
import 'package:portfolio/util/double.dart';
import 'package:portfolio/util/term.dart';
import 'package:portfolio/widget/app_pageview.dart';
import 'package:portfolio/widget/markdown.dart';
import 'package:portfolio/widget/media_query.dart';
import 'package:portfolio/widget/section.dart';
import 'package:portfolio/widget/text.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({
    super.key,
    required this.projects,
    required this.scrollKey,
  });
  final List<Project> projects;
  final GlobalKey scrollKey;

  @override
  Widget build(BuildContext context) {
    return Section(
      padding: EdgeInsets.zero,
      title: "Projects",
      scrollKey: scrollKey,
      child: ScreenTypeLayout.builder(
        breakpoints: const ScreenBreakpoints(
          desktop: 870,
          tablet: 679,
          watch: 200,
        ),
        desktop: (context) => _PageViewDesktop(projects: projects),
        tablet: (context) => _PageViewMobile(projects: projects),
        mobile: (context) => _PageViewMobile(projects: projects),
        watch: (context) => _PageViewMobile(projects: projects),
      ),
    );
  }
}

class _PageViewMobile extends StatelessWidget {
  const _PageViewMobile({required this.projects});
  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    return _PageView(
      infoWidth: 500,
      pageviewHeight: 1300,
      projects: projects,
      builder: (context, project) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _ProjectTitle(project: project),
            _Screens(paths: project.sampleImages),
            const SizedBox(height: 50),
            _ProjectDetails(project: project),
          ],
        );
      },
    );
    ;
  }
}

class _PageViewDesktop extends StatelessWidget {
  const _PageViewDesktop({required this.projects});
  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    return _PageView(
      infoWidth: 740,
      pageviewHeight: 700,
      projects: projects,
      builder: (context, project) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _Screens(paths: project.sampleImages),
            SizedBox(width: MediaQuery.of(context).size.widthRatio08),
            Column(
              children: [
                _ProjectTitle(project: project),
                _ProjectDetails(project: project),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _PageView extends StatefulWidget {
  const _PageView({
    required this.projects,
    required this.builder,
    required this.infoWidth,
    required this.pageviewHeight,
  });

  final List<Project> projects;
  final double infoWidth;
  final double pageviewHeight;
  final Widget Function(BuildContext context, Project project) builder;

  @override
  State<_PageView> createState() => _PageViewState();
}

class _PageViewState extends State<_PageView> {
  late Company _company = widget.projects.first.company!;
  Term get _term => Term(
        start: _company.startDate,
        end: _company.endDate,
      );

  void onPageChanged(Project project) {
    setState(() {
      _company = project.company!;
    });
  }

  @override
  Widget build(BuildContext parents) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _CompanyInfo(
          width: widget.infoWidth,
          company: _company,
          term: _term,
        ),
        const SizedBox(height: 50),
        AppPageView<Project>(
          key: Keys.projectPageViewKey,
          height: widget.pageviewHeight,
          items: widget.projects,
          onPageChanged: onPageChanged,
          builder: (context, item) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: widget.builder(context, item),
            );
          },
        ),
      ],
    );
  }
}

class _CompanyInfo extends StatelessWidget {
  const _CompanyInfo({
    required this.company,
    required this.term,
    required this.width,
  });

  final Company company;
  final Term term;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _Logo(path: company.logo),
                const SizedBox(width: 20),
                T.b1(context, company.title),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                T.b2(context, MD.dash(term.termDisplay)),
                const SizedBox(width: 10),
                T.b2(context, MD.wrap(term.durationDisplay)),
              ],
            ),
            T.b2(context, MD.dash(company.description)),
            T.b2(context, MD.dash(company.position.title)),
            const SizedBox(height: 10),
            T.b2(context, MD.ol("직무 및 주요 성과")),
            T.b2(context, MD.olTabs(company.achievements)),
          ],
        ),
      ),
    );
  }
}

class _Screens extends StatelessWidget {
  const _Screens({required this.paths});

  final List<String> paths;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: AppPageView<String>(
          height: 540,
          width: 250,
          items: paths,
          mover: false,
          physics: const ClampingScrollPhysics(),
          pageIndicator: true,
          builder: (context, path) {
            return Image.asset(
              path,
              width: 250,
              fit: BoxFit.fitWidth,
            );
          }),
    );
  }
}

class _ProjectDetails extends StatelessWidget {
  const _ProjectDetails({required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (project.isTerm)
          Column(
            children: [
              T.b1(
                  context,
                  MD.ol(
                      "기간: ${project.term!.termDisplay} (${project.term!.durationDisplay})")),
              const SizedBox(height: 10),
            ],
          ),
        T.b1(context, MD.ol("개발 환경: ${project.devEnvStrnig}")),
        if (project.contribution != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              T.b1(context, MD.ol("인원: ${project.contribution}")),
              T.b1(
                  context,
                  MD.ol(
                      "직무 기여도: ${project.contribution!.contribution.percentDisplay}")),
            ],
          ),
        const SizedBox(height: 10),
        T.b1(context, MD.ol("주요 기능: ")),
        T.b1(context, MD.olTabs(project.functions)),
        if (project.achievements.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              T.b1(context, MD.ol("주요 성과: ")),
              T.b1(context, MD.olTabs(project.achievements)),
            ],
          ),
      ],
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({
    required this.path,
  });

  final String path;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      fit: BoxFit.fitHeight,
      height: 40,
    );
  }
}

class _ProjectTitle extends StatelessWidget {
  const _ProjectTitle({required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            T.h3(project.title),
            const SizedBox(width: 10),
            if (project.isStoreUrl) _GoToStore(storeUrl: project.storeUrl!),
          ],
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}

class _GoToStore extends StatelessWidget {
  const _GoToStore({required this.storeUrl});
  final StoreUrl storeUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () => launchUrlString(storeUrl.ios),
            tooltip: "앱스토어로 이동",
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.apple,
              size: 30,
            )),
        const SizedBox(width: 5),
        IconButton(
            onPressed: () => launchUrlString(storeUrl.android),
            tooltip: "플레이스토어로 이동",
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.android,
              size: 30,
            )),
      ],
    );
  }
}
