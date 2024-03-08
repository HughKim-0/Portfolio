import 'dart:html';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/utils/fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AnchorTab extends StatefulWidget {
  final List<String> tabs;
  final List<Widget> body;
  final Duration animationDuration;
  final Curve animationCurve;
  final ScrollController? scrollController;
  final double tabHeight;
  final double selectedTabHeight;
  final bool rebuildBody;

  const AnchorTab({
    required this.tabs,
    required this.body,
    this.animationDuration = const Duration(milliseconds: 1000),
    this.animationCurve = Curves.ease,
    this.scrollController,
    this.rebuildBody = true,
    this.tabHeight = 35,
    this.selectedTabHeight = 40,
    super.key,
  }) : assert(tabs.length == body.length);

  @override
  _AnchorTabState createState() => _AnchorTabState();
}

class _AnchorTabState extends State<AnchorTab> {
  late List<GlobalKey?> keysTabs;
  late List<GlobalKey?> keysBody;
  Widget? bodyWidget;
  List<double>? visibility;
  int selectedTab = 0;
  DateTime ensureVisibleTime = DateTime.now();

  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1500;

  bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200 &&
      MediaQuery.of(context).size.width < 1500;

  bool isMediumTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1029 &&
      MediaQuery.of(context).size.width < 1200;

  bool isSmallTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 818 &&
      MediaQuery.of(context).size.width < 1029;

  bool isMiniTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 613 &&
      MediaQuery.of(context).size.width < 818;

  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 613;

  final DateTime now = DateTime.now();

  void downloadResumeFile(url) {
    AnchorElement anchorElement = new AnchorElement(href: url);
    anchorElement.download = "Hugh Kim Resume";
    anchorElement.click();
  }

  void downloadCoverLetterFile(url) {
    AnchorElement anchorElement = new AnchorElement(href: url);
    anchorElement.download = "Hugh Kim Cover Letter";
    anchorElement.click();
  }

  @override
  Widget build(BuildContext context) {
    keysTabs = List.generate(widget.tabs.length, (index) => null);

    final double screenWidth = MediaQuery.of(context).size.width;

    final Widget tabsWidget = createTabsWidget();

    final List<Widget> blocks = [];

    if (visibility == null ||
        visibility!.length != widget.tabs.length ||
        widget.rebuildBody) {
      visibility = List.generate(widget.tabs.length, (index) => 0);
      keysBody = List.generate(widget.body.length, (index) => null);
      for (int i = 0; i < widget.body.length; i++) {
        final String widgetMapKey = widget.tabs[i];
        final Widget targetWiget = widget.body[i];
        blocks.add(generateBlock(i, widgetMapKey, screenWidth, targetWiget));
      }

      bodyWidget = SingleChildScrollView(
        controller: widget.scrollController ?? ScrollController(),
        child: Column(
          children: blocks,
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: isDesktop(context)
          ? Padding(
              padding: const EdgeInsets.only(
                  left: 150, right: 150, top: 60, bottom: 60),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 352,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hugh Kim',
                              style: AppTextStyles.nameHeadingStyle(),
                            ),
                            Text(
                              'Web Developer',
                              style: AppTextStyles.titleStyle(),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: AppColors.cardColor,
                                  ),
                                  child: Text(
                                    'Flutter',
                                    style: AppTextStyles.cardSkillsStyle(),
                                  ),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: AppColors.cardColor,
                                  ),
                                  child: Text(
                                    'Dart',
                                    style: AppTextStyles.cardSkillsStyle(),
                                  ),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: AppColors.cardColor,
                                  ),
                                  child: Text(
                                    'Wordpress',
                                    style: AppTextStyles.cardSkillsStyle(),
                                  ),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: AppColors.cardColor,
                                  ),
                                  child: Text(
                                    'Firebase',
                                    style: AppTextStyles.cardSkillsStyle(),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: AppColors.cardColor,
                                  ),
                                  child: Text(
                                    'React',
                                    style: AppTextStyles.cardSkillsStyle(),
                                  ),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: AppColors.cardColor,
                                  ),
                                  child: Text(
                                    'HTML',
                                    style: AppTextStyles.cardSkillsStyle(),
                                  ),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: AppColors.cardColor,
                                  ),
                                  child: Text(
                                    'CSS',
                                    style: AppTextStyles.cardSkillsStyle(),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              'As a potentially skilled web developer with a passion for creating robust and user-friendly website, app, and program.',
                              style: AppTextStyles.introStyle(),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            tabsWidget,
                            const SizedBox(
                              height: 70,
                            ),
                            Row(
                              children: [
                                TextButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              side: BorderSide(
                                                  color:
                                                      AppColors.buttonColor)))),
                                  onPressed: () async {
                                    downloadCoverLetterFile(
                                        'assets/lib/cv/Hugh Kim - Cover Letter.pdf');
                                    downloadResumeFile(
                                        'assets/lib/cv/Hugh Kim - Resume.pdf');
                                  },
                                  child: Text(
                                    'CV Download',
                                    style: AppTextStyles.downloadButtonStyle(),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                IconButton(
                                  onPressed: () async {
                                    if (await canLaunch(
                                        'https://github.com/HughKim-0')) {
                                      await launch(
                                          'https://github.com/HughKim-0');
                                    } else {
                                      throw 'Could not launch Website';
                                    }
                                  },
                                  icon: FaIcon(
                                    FontAwesomeIcons.github,
                                    size: 30,
                                    color: whiteColor,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                IconButton(
                                  onPressed: () async {
                                    if (await canLaunch(
                                        'https://www.linkedin.com/in/hugh-kim-b8200728a/')) {
                                      await launch(
                                          'https://www.linkedin.com/in/hugh-kim-b8200728a/');
                                    } else {
                                      throw 'Could not launch Website';
                                    }
                                  },
                                  icon: FaIcon(
                                    FontAwesomeIcons.linkedin,
                                    size: 30,
                                    color: whiteColor,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                IconButton(
                                  onPressed: () async {
                                    if (await canLaunch(
                                        'https://www.instagram.com/a_hugh_/')) {
                                      await launch(
                                          'https://www.instagram.com/a_hugh_/');
                                    } else {
                                      throw 'Could not launch Website';
                                    }
                                  },
                                  icon: FaIcon(
                                    FontAwesomeIcons.instagram,
                                    size: 30,
                                    color: whiteColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Text(
                              'Built with Flutter and Dart.',
                              style: AppTextStyles.copyRightStyle(),
                            ),
                            Text(
                              '\u00A9 ${now.year} Hugh Kim. All Rights Reserved.',
                              style: AppTextStyles.copyRightStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: bodyWidget!),
                    ),
                  )
                ],
              ),
            )
          : isTablet(context)
              ? Padding(
                  padding: const EdgeInsets.only(
                      left: 50, right: 50, top: 60, bottom: 60),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: 352,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hugh Kim',
                                  style: AppTextStyles.nameHeadingStyle(),
                                ),
                                Text(
                                  'Web App Developer',
                                  style: AppTextStyles.titleStyle(),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: AppColors.cardColor,
                                      ),
                                      child: Text(
                                        'Flutter',
                                        style: AppTextStyles.cardSkillsStyle(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: AppColors.cardColor,
                                      ),
                                      child: Text(
                                        'Dart',
                                        style: AppTextStyles.cardSkillsStyle(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: AppColors.cardColor,
                                      ),
                                      child: Text(
                                        'Wordpress',
                                        style: AppTextStyles.cardSkillsStyle(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: AppColors.cardColor,
                                      ),
                                      child: Text(
                                        'Firebase',
                                        style: AppTextStyles.cardSkillsStyle(),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: AppColors.cardColor,
                                      ),
                                      child: Text(
                                        'React',
                                        style: AppTextStyles.cardSkillsStyle(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: AppColors.cardColor,
                                      ),
                                      child: Text(
                                        'HTML',
                                        style: AppTextStyles.cardSkillsStyle(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: AppColors.cardColor,
                                      ),
                                      child: Text(
                                        'CSS',
                                        style: AppTextStyles.cardSkillsStyle(),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'As a potentially skilled web developer with a passion for creating robust and user-friendly website, app, and program.',
                                  style: AppTextStyles.introStyle(),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                tabsWidget,
                                const SizedBox(
                                  height: 60,
                                ),
                                Row(
                                  children: [
                                    TextButton(
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  side: BorderSide(
                                                      color: AppColors
                                                          .buttonColor)))),
                                      onPressed: () async {
                                        downloadCoverLetterFile(
                                            'assets/lib/cv/Hugh Kim - Cover Letter.pdf');
                                        downloadResumeFile(
                                            'assets/lib/cv/Hugh Kim - Resume.pdf');
                                      },
                                      child: Text(
                                        'CV Download',
                                        style:
                                            AppTextStyles.downloadButtonStyle(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        if (await canLaunch(
                                            'https://github.com/HughKim-0')) {
                                          await launch(
                                              'https://github.com/HughKim-0');
                                        } else {
                                          throw 'Could not launch Website';
                                        }
                                      },
                                      icon: FaIcon(
                                        FontAwesomeIcons.github,
                                        size: 30,
                                        color: whiteColor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        if (await canLaunch(
                                            'https://www.linkedin.com/in/hugh-kim-b8200728a/')) {
                                          await launch(
                                              'https://www.linkedin.com/in/hugh-kim-b8200728a/');
                                        } else {
                                          throw 'Could not launch Website';
                                        }
                                      },
                                      icon: FaIcon(
                                        FontAwesomeIcons.linkedin,
                                        size: 30,
                                        color: whiteColor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        if (await canLaunch(
                                            'https://www.instagram.com/a_hugh_/')) {
                                          await launch(
                                              'https://www.instagram.com/a_hugh_/');
                                        } else {
                                          throw 'Could not launch Website';
                                        }
                                      },
                                      icon: FaIcon(
                                        FontAwesomeIcons.instagram,
                                        size: 30,
                                        color: whiteColor,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 14,
                                ),
                                Text(
                                  'Built with Flutter and Dart.',
                                  style: AppTextStyles.copyRightStyle(),
                                ),
                                Text(
                                  '\u00A9 ${now.year} Hugh Kim. All Rights Reserved.',
                                  style: AppTextStyles.copyRightStyle(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: bodyWidget!),
                        ),
                      )
                    ],
                  ),
                )
              : isMediumTablet(context)
                  ? Padding(
                      padding: const EdgeInsets.only(
                          left: 50, right: 50, top: 60, bottom: 60),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 352,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hugh Kim',
                                      style: AppTextStyles.nameHeadingStyle(),
                                    ),
                                    Text(
                                      'Web App Developer',
                                      style: AppTextStyles.titleStyle(),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            color: AppColors.cardColor,
                                          ),
                                          child: Text(
                                            'Flutter',
                                            style:
                                                AppTextStyles.cardSkillsStyle(),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            color: AppColors.cardColor,
                                          ),
                                          child: Text(
                                            'Dart',
                                            style:
                                                AppTextStyles.cardSkillsStyle(),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            color: AppColors.cardColor,
                                          ),
                                          child: Text(
                                            'Wordpress',
                                            style:
                                                AppTextStyles.cardSkillsStyle(),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            color: AppColors.cardColor,
                                          ),
                                          child: Text(
                                            'Firebase',
                                            style:
                                                AppTextStyles.cardSkillsStyle(),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            color: AppColors.cardColor,
                                          ),
                                          child: Text(
                                            'React',
                                            style:
                                                AppTextStyles.cardSkillsStyle(),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            color: AppColors.cardColor,
                                          ),
                                          child: Text(
                                            'HTML',
                                            style:
                                                AppTextStyles.cardSkillsStyle(),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            color: AppColors.cardColor,
                                          ),
                                          child: Text(
                                            'CSS',
                                            style:
                                                AppTextStyles.cardSkillsStyle(),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      'As a potentially skilled web developer with a passion for creating robust and user-friendly website, app, and program.',
                                      style: AppTextStyles.introStyle(),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    tabsWidget,
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    Row(
                                      children: [
                                        TextButton(
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      side: BorderSide(
                                                          color: AppColors
                                                              .buttonColor)))),
                                          onPressed: () async {
                                            downloadCoverLetterFile(
                                                'assets/lib/cv/Hugh Kim - Cover Letter.pdf');
                                            downloadResumeFile(
                                                'assets/lib/cv/Hugh Kim - Resume.pdf');
                                          },
                                          child: Text(
                                            'CV Download',
                                            style: AppTextStyles
                                                .downloadButtonStyle(),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        IconButton(
                                          onPressed: () async {
                                            if (await canLaunch(
                                                'https://github.com/HughKim-0')) {
                                              await launch(
                                                  'https://github.com/HughKim-0');
                                            } else {
                                              throw 'Could not launch Website';
                                            }
                                          },
                                          icon: const FaIcon(
                                            FontAwesomeIcons.github,
                                            size: 30,
                                            color: whiteColor,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        IconButton(
                                          onPressed: () async {
                                            if (await canLaunch(
                                                'https://www.linkedin.com/in/hugh-kim-b8200728a/')) {
                                              await launch(
                                                  'https://www.linkedin.com/in/hugh-kim-b8200728a/');
                                            } else {
                                              throw 'Could not launch Website';
                                            }
                                          },
                                          icon: const FaIcon(
                                            FontAwesomeIcons.linkedin,
                                            size: 30,
                                            color: whiteColor,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        IconButton(
                                          onPressed: () async {
                                            if (await canLaunch(
                                                'https://www.instagram.com/a_hugh_/')) {
                                              await launch(
                                                  'https://www.instagram.com/a_hugh_/');
                                            } else {
                                              throw 'Could not launch Website';
                                            }
                                          },
                                          icon: FaIcon(
                                            FontAwesomeIcons.instagram,
                                            size: 30,
                                            color: whiteColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 14,
                                    ),
                                    Text(
                                      'Built with Flutter and Dart.',
                                      style: AppTextStyles.copyRightStyle(),
                                    ),
                                    Text(
                                      '\u00A9 ${now.year} Hugh Kim. All Rights Reserved.',
                                      style: AppTextStyles.copyRightStyle(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  child: bodyWidget!),
                            ),
                          )
                        ],
                      ),
                    )
                  : isSmallTablet(context)
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 50, right: 50, top: 50, bottom: 50),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  width: 352,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Hugh Kim',
                                          style:
                                              AppTextStyles.nameHeadingStyle(),
                                        ),
                                        Text(
                                          'Web App Developer',
                                          style: AppTextStyles.titleStyle(),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                color: AppColors.cardColor,
                                              ),
                                              child: Text(
                                                'Flutter',
                                                style: AppTextStyles
                                                    .cardSkillsStyle(),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 6,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                color: AppColors.cardColor,
                                              ),
                                              child: Text(
                                                'Dart',
                                                style: AppTextStyles
                                                    .cardSkillsStyle(),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 6,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                color: AppColors.cardColor,
                                              ),
                                              child: Text(
                                                'Firebase',
                                                style: AppTextStyles
                                                    .cardSkillsStyle(),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                color: AppColors.cardColor,
                                              ),
                                              child: Text(
                                                'Wordpress',
                                                style: AppTextStyles
                                                    .cardSkillsStyle(),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 6,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                color: AppColors.cardColor,
                                              ),
                                              child: Text(
                                                'React',
                                                style: AppTextStyles
                                                    .cardSkillsStyle(),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                color: AppColors.cardColor,
                                              ),
                                              child: Text(
                                                'CSS',
                                                style: AppTextStyles
                                                    .cardSkillsStyle(),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 6,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                color: AppColors.cardColor,
                                              ),
                                              child: Text(
                                                'HTML',
                                                style: AppTextStyles
                                                    .cardSkillsStyle(),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Text(
                                          'As a potentially skilled web developer with a passion for creating robust and user-friendly website, app, and program.',
                                          style: AppTextStyles.introStyle(),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        tabsWidget,
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        TextButton(
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      side: BorderSide(
                                                          color: AppColors
                                                              .buttonColor)))),
                                          onPressed: () async {
                                            downloadCoverLetterFile(
                                                'assets/lib/cv/Hugh Kim - Cover Letter.pdf');
                                            downloadResumeFile(
                                                'assets/lib/cv/Hugh Kim - Resume.pdf');
                                          },
                                          child: Text(
                                            'CV Download',
                                            style: AppTextStyles
                                                .downloadButtonStyle(),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () async {
                                                if (await canLaunch(
                                                    'https://github.com/HughKim-0')) {
                                                  await launch(
                                                      'https://github.com/HughKim-0');
                                                } else {
                                                  throw 'Could not launch Website';
                                                }
                                              },
                                              icon: FaIcon(
                                                FontAwesomeIcons.github,
                                                size: 30,
                                                color: whiteColor,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            IconButton(
                                              onPressed: () async {
                                                if (await canLaunch(
                                                    'https://www.linkedin.com/in/hugh-kim-b8200728a/')) {
                                                  await launch(
                                                      'https://www.linkedin.com/in/hugh-kim-b8200728a/');
                                                } else {
                                                  throw 'Could not launch Website';
                                                }
                                              },
                                              icon: FaIcon(
                                                FontAwesomeIcons.linkedin,
                                                size: 30,
                                                color: whiteColor,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            IconButton(
                                              onPressed: () async {
                                                if (await canLaunch(
                                                    'https://www.instagram.com/a_hugh_/')) {
                                                  await launch(
                                                      'https://www.instagram.com/a_hugh_/');
                                                } else {
                                                  throw 'Could not launch Website';
                                                }
                                              },
                                              icon: FaIcon(
                                                FontAwesomeIcons.instagram,
                                                size: 30,
                                                color: whiteColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 14,
                                        ),
                                        Text(
                                          'Built with Flutter and Dart.',
                                          style: AppTextStyles.copyRightStyle(),
                                        ),
                                        Text(
                                          '\u00A9 ${now.year} Hugh Kim. All Rights Reserved.',
                                          style: AppTextStyles.copyRightStyle(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      child: bodyWidget!),
                                ),
                              )
                            ],
                          ),
                        )
                      : isMiniTablet(context)
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 20),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'Hugh Kim',
                                              style: AppTextStyles
                                                  .nameMiniHeadingStyle(),
                                            ),
                                            Text(
                                              'Web App Developer',
                                              style: AppTextStyles
                                                  .titleMiniStyle(),
                                            ),
                                            const SizedBox(
                                              height: 6,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    color: AppColors.cardColor,
                                                  ),
                                                  child: Text(
                                                    'Flutter',
                                                    style: AppTextStyles
                                                        .cardSkillsStyle(),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 6,
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    color: AppColors.cardColor,
                                                  ),
                                                  child: Text(
                                                    'Dart',
                                                    style: AppTextStyles
                                                        .cardSkillsStyle(),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 6,
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    color: AppColors.cardColor,
                                                  ),
                                                  child: Text(
                                                    'Wordpress',
                                                    style: AppTextStyles
                                                        .cardSkillsStyle(),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 6,
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    color: AppColors.cardColor,
                                                  ),
                                                  child: Text(
                                                    'Firebase',
                                                    style: AppTextStyles
                                                        .cardSkillsStyle(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            Text(
                                              'As a potentially skilled web developer with a passion for creating robust and user-friendly website, app, and program.',
                                              style: AppTextStyles.introStyle(),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: tabsWidget,
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Row(
                                                    children: [
                                                      TextButton(
                                                        style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<
                                                                    RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    side: BorderSide(
                                                                        color: AppColors
                                                                            .buttonColor)))),
                                                        onPressed: () async {
                                                          downloadCoverLetterFile(
                                                              'assets/lib/cv/Hugh Kim - Cover Letter.pdf');
                                                          downloadResumeFile(
                                                              'assets/lib/cv/Hugh Kim - Resume.pdf');
                                                        },
                                                        child: Text(
                                                          'CV Download',
                                                          style: AppTextStyles
                                                              .downloadButtonStyle(),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 15,
                                                      ),
                                                      IconButton(
                                                        onPressed: () async {
                                                          if (await canLaunch(
                                                              'https://github.com/HughKim-0')) {
                                                            await launch(
                                                                'https://github.com/HughKim-0');
                                                          } else {
                                                            throw 'Could not launch Website';
                                                          }
                                                        },
                                                        icon: FaIcon(
                                                          FontAwesomeIcons
                                                              .github,
                                                          size: 30,
                                                          color: whiteColor,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 15,
                                                      ),
                                                      IconButton(
                                                        onPressed: () async {
                                                          if (await canLaunch(
                                                              'https://www.linkedin.com/in/hugh-kim-b8200728a/')) {
                                                            await launch(
                                                                'https://www.linkedin.com/in/hugh-kim-b8200728a/');
                                                          } else {
                                                            throw 'Could not launch Website';
                                                          }
                                                        },
                                                        icon: FaIcon(
                                                          FontAwesomeIcons
                                                              .linkedin,
                                                          size: 30,
                                                          color: whiteColor,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 15,
                                                      ),
                                                      IconButton(
                                                        onPressed: () async {
                                                          if (await canLaunch(
                                                              'https://www.instagram.com/a_hugh_/')) {
                                                            await launch(
                                                                'https://www.instagram.com/a_hugh_/');
                                                          } else {
                                                            throw 'Could not launch Website';
                                                          }
                                                        },
                                                        icon: FaIcon(
                                                          FontAwesomeIcons
                                                              .instagram,
                                                          size: 30,
                                                          color: whiteColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      child: SingleChildScrollView(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          child: Column(
                                            children: [
                                              bodyWidget!,
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                'Built with Flutter and Dart.',
                                                style: AppTextStyles
                                                    .copyRightStyle(),
                                              ),
                                              Text(
                                                '\u00A9 ${now.year} Hugh Kim. All Rights Reserved.',
                                                style: AppTextStyles
                                                    .copyRightStyle(),
                                              ),
                                            ],
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 10, bottom: 10),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'Hugh Kim',
                                              style: AppTextStyles
                                                  .nameMiniHeadingStyle(),
                                            ),
                                            Text(
                                              'Web App Developer',
                                              style: AppTextStyles
                                                  .titleMiniStyle(),
                                            ),
                                            const SizedBox(
                                              height: 6,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    color: AppColors.cardColor,
                                                  ),
                                                  child: Text(
                                                    'Flutter',
                                                    style: AppTextStyles
                                                        .cardSkillsStyle(),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 6,
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    color: AppColors.cardColor,
                                                  ),
                                                  child: Text(
                                                    'Dart',
                                                    style: AppTextStyles
                                                        .cardSkillsStyle(),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 6,
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    color: AppColors.cardColor,
                                                  ),
                                                  child: Text(
                                                    'Wordpress',
                                                    style: AppTextStyles
                                                        .cardSkillsStyle(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                color: AppColors.cardColor,
                                              ),
                                              child: Text(
                                                'Firebase',
                                                style: AppTextStyles
                                                    .cardSkillsStyle(),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            Text(
                                              'As a potentially skilled web developer with a passion for creating robust and user-friendly website, app, and program.',
                                              style: AppTextStyles.introStyle(),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                TextButton(
                                                  style: ButtonStyle(
                                                      shape: MaterialStateProperty.all<
                                                              RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              side: BorderSide(
                                                                  color: AppColors
                                                                      .buttonColor)))),
                                                  onPressed: () async {
                                                    downloadCoverLetterFile(
                                                        'assets/lib/cv/Hugh Kim - Cover Letter.pdf');
                                                    downloadResumeFile(
                                                        'assets/lib/cv/Hugh Kim - Resume.pdf');
                                                  },
                                                  child: Text(
                                                    'CV Download',
                                                    style: AppTextStyles
                                                        .downloadButtonStyle(),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                IconButton(
                                                  onPressed: () async {
                                                    if (await canLaunch(
                                                        'https://github.com/HughKim-0')) {
                                                      await launch(
                                                          'https://github.com/HughKim-0');
                                                    } else {
                                                      throw 'Could not launch Website';
                                                    }
                                                  },
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.github,
                                                    size: 30,
                                                    color: whiteColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                IconButton(
                                                  onPressed: () async {
                                                    if (await canLaunch(
                                                        'https://www.linkedin.com/in/hugh-kim-b8200728a/')) {
                                                      await launch(
                                                          'https://www.linkedin.com/in/hugh-kim-b8200728a/');
                                                    } else {
                                                      throw 'Could not launch Website';
                                                    }
                                                  },
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.linkedin,
                                                    size: 30,
                                                    color: whiteColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                IconButton(
                                                  onPressed: () async {
                                                    if (await canLaunch(
                                                        'https://www.instagram.com/a_hugh_/')) {
                                                      await launch(
                                                          'https://www.instagram.com/a_hugh_/');
                                                    } else {
                                                      throw 'Could not launch Website';
                                                    }
                                                  },
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.instagram,
                                                    size: 30,
                                                    color: whiteColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            bodyWidget!,
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              'Built with Flutter and Dart.',
                                              style: AppTextStyles
                                                  .copyRightStyle(),
                                            ),
                                            Text(
                                              '\u00A9 ${now.year} Hugh Kim. All Rights Reserved.',
                                              style: AppTextStyles
                                                  .copyRightStyle(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
    );
  }

  Widget createTabsWidget() {
    // Create the tabs widget
    final List<Widget> tabsItems = [];

    for (int i = 0; i < widget.tabs.length; i++) {
      final String widgetMapKey = widget.tabs[i];
      final GlobalKey tabKey = GlobalKey(debugLabel: 'tab $i');
      keysTabs[i] = tabKey;

      tabsItems.add(
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MaterialButton(
                padding: const EdgeInsets.all(0),
                minWidth: 30,
                key: tabKey,
                textColor: selectedTab == i ? Colors.yellow : Colors.white,
                height: 40,
                child: Text(
                  widgetMapKey,
                  style: isDesktop(context)
                      ? AppTextStyles.menuStyle()
                      : isTablet(context)
                          ? AppTextStyles.menuStyle()
                          : isMediumTablet(context)
                              ? AppTextStyles.menuStyle()
                              : isSmallTablet(context)
                                  ? AppTextStyles.menuStyle()
                                  : isMiniTablet(context)
                                      ? AppTextStyles.menuMiniStyle()
                                      : AppTextStyles.menuMiniStyle(),
                ),
                onPressed: () {
                  scrollToWidgetWithKey(keysBody[i]!);
                  if (mounted) {
                    setState(() {
                      selectedTab = i;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      );
    }

    final Widget tabsWidget = Container(
      margin: const EdgeInsets.all(5),
      height: 100,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: tabsItems,
      ),
    );

    return tabsWidget;
  }

  /// Generate block for the index
  Widget generateBlock(
      int index, String widgetMapKey, double screenWidth, Widget targetWidget) {
    final GlobalKey key = GlobalKey(debugLabel: 'block$index');
    keysBody[index] = key;

    return VisibilityDetector(
        key: key,
        onVisibilityChanged: (visibilityInfo) {
          final visiblePercentage = visibilityInfo.visibleFraction * 100;
          visibility![index] = visiblePercentage;
          final int currentIndex = lastVisibleIndex(visibility!);

          final bool validIndex = currentIndex >= 0;
          final bool changedTab = selectedTab != currentIndex;
          final bool isVisible = visiblePercentage > 0;
          if (validIndex && changedTab && isVisible) {
            if (mounted) {
              if (DateTime.now()
                  .isBefore(ensureVisibleTime.add(widget.animationDuration))) {
                return;
              }

              setState(
                () {
                  selectedTab = currentIndex;
                  scrollToWidgetWithKey(keysTabs[currentIndex]!);
                },
              );
            }
          }
        },
        child: targetWidget);
  }

  void scrollToWidgetWithKey(GlobalKey key) {
    if (key.currentContext != null) {
      ensureVisibleTime = DateTime.now();
      Scrollable.ensureVisible(key.currentContext!,
          duration: widget.animationDuration, curve: widget.animationCurve);
    }
  }

  static int lastVisibleIndex(List<double> visibility) {
    const int lastIndex = -1;

    if (visibility[0] > 0) {
      return 0;
    } else if (visibility[visibility.length - 1] > 0) {
      return visibility.length - 1;
    }

    for (int i = 1; i < visibility.length - 1; i++) {
      if (visibility[i] > 0) {
        return i;
      }
    }

    return lastIndex;
  }
}
