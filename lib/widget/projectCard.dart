import 'package:flutter/material.dart';
import 'package:portfolio/utils/fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCardForm extends StatefulWidget {
  final String image;
  final String title;
  final List skills;
  final String desc;
  final String feature;
  final String archive;
  final String url;

  const ProjectCardForm({
    super.key,
    required this.image,
    required this.title,
    required this.skills,
    required this.desc,
    required this.feature,
    required this.archive,
    required this.url,
  });

  @override
  State<ProjectCardForm> createState() => _ProjectCardFormState();
}

class _ProjectCardFormState extends State<ProjectCardForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        elevation: 5,
        color: AppColors.bgColor,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    children: [
                      Image.asset(
                        widget.image,
                        width: 160,
                        height: 160,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 6,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.title,
                        style: AppTextStyles.cardTitletyle(),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          for (String skill in widget.skills)
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
                                    skill,
                                    style: AppTextStyles.cardSkillsStyle(),
                                  ),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                              ],
                            ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.desc,
                        style: AppTextStyles.cardDescStyle(),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        widget.feature,
                        style: AppTextStyles.cardDescStyle(),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        widget.archive,
                        style: AppTextStyles.cardDescStyle(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    side: BorderSide(
                                        color: AppColors.buttonColor)))),
                        onPressed: () async {
                          String url = widget.url;
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Text(
                          'Visit',
                          style: AppTextStyles.buttonStyle(),
                        ),
                      ),
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
