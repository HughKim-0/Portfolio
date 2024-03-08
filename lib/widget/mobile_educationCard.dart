import 'package:flutter/material.dart';
import 'package:portfolio/utils/fonts.dart';

class MobileEducationCardForm extends StatefulWidget {
  final String period;
  final String school;
  final String major;
  final String status;

  const MobileEducationCardForm({
    super.key,
    required this.period,
    required this.status,
    required this.school,
    required this.major,
  });

  @override
  State<MobileEducationCardForm> createState() =>
      _MobileEducationCardFormState();
}

class _MobileEducationCardFormState extends State<MobileEducationCardForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                      widget.school,
                      style: AppTextStyles.cardTitletyle(),
                    ),
                    Text(
                      widget.period,
                      style: AppTextStyles.cardDescStyle(),
                    ),
                    Text(
                      widget.status,
                      style: AppTextStyles.cardDescStyle(),
                    ),
                    Text(
                      widget.major,
                      style: AppTextStyles.cardSkillsStyle(),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
