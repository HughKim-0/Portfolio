import 'package:flutter/material.dart';
import 'package:portfolio/utils/fonts.dart';

class EducationCardForm extends StatefulWidget {
  final String period;
  final String school;
  final String major;
  final String status;

  const EducationCardForm({
    super.key,
    required this.period,
    required this.status,
    required this.school,
    required this.major,
  });

  @override
  State<EducationCardForm> createState() => _EducationCardFormState();
}

class _EducationCardFormState extends State<EducationCardForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.period,
                      style: AppTextStyles.cardDescStyle(),
                    ),
                    Text(
                      widget.status,
                      style: AppTextStyles.cardDescStyle(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.school,
                      style: AppTextStyles.cardTitletyle(),
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
