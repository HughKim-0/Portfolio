import 'package:flutter/material.dart';
import 'package:portfolio/utils/fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileExperienceCardForm extends StatefulWidget {
  final String period;
  final String company;
  final String position;
  final String desc;
  final String url;

  const MobileExperienceCardForm({
    super.key,
    required this.period,
    required this.company,
    required this.position,
    required this.desc,
    required this.url,
  });

  @override
  State<MobileExperienceCardForm> createState() =>
      _MobileExperienceCardFormState();
}

class _MobileExperienceCardFormState extends State<MobileExperienceCardForm> {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.period,
                        style: AppTextStyles.cardDescStyle(),
                      ),
                      Text(
                        widget.company,
                        style: AppTextStyles.cardTitletyle(),
                      ),
                      Text(
                        widget.position,
                        style: AppTextStyles.cardSkillsStyle(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.desc,
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
                          'Vist',
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
