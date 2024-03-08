import 'package:flutter/material.dart';
import 'package:portfolio/utils/fonts.dart';
import 'package:portfolio/widget/anchor_tab.dart';
import 'package:portfolio/widget/educationCard.dart';
import 'package:portfolio/widget/experienceCard.dart';
import 'package:portfolio/widget/mobile_educationCard.dart';
import 'package:portfolio/widget/mobile_experienceCard.dart';
import 'package:portfolio/widget/mobile_projectCard.dart';
import 'package:portfolio/widget/projectCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List CRMSkillsList = ['Flutter', 'Dart', 'Firebase'];
  final List commacSkillsList = ['Flutter', 'Dart', 'Firebase'];
  final List canelDeerSkillsList = ['Wordpress', 'Woo Commerce'];
  final List umeSushiSkillsList = ['Wordpress', 'Restropress'];

  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600;

  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: isDesktop(context)
          ? Container(
              child: AnchorTab(
                tabs: [
                  'Projects',
                  'About',
                  'Experiences',
                ],
                key: UniqueKey(),
                body: [
                  Column(
                    children: [
                      ProjectCardForm(
                        image: 'lib/images/webonologyCRM.jpeg',
                        title: 'Webonology CRM',
                        skills: CRMSkillsList,
                        desc:
                            'Webonology CRM is a comprehensive web application tailored to meet the unique needs of nail and hair salons, providing an efficient Customer Relationship Management (CRM) solution. ',
                        feature:
                            '- Seamlessly handle bookings with an intuitive system. \n- Keep track of customer information, preferences, and history.\n- Easily manage and update the range of services offered by the salon.\n- Streamline staff information and schedules for optimal resource utilization.',
                        archive:
                            'Co-initiated and co-operated, most of front end, language setting, parts of back end.',
                        url: 'https://crm.webonology.ca/',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProjectCardForm(
                        image: 'lib/images/commac.jpeg',
                        title: 'Command Accepted',
                        skills: commacSkillsList,
                        desc:
                            'Command Accepted is a user-friendly application designed for seamless command exchange among individuals.',
                        feature:
                            '- One-click command exchange\n- Seamless integration with mobile calendars\n- Firebase-powered database for reliability\n- Unique \'uid\' for users, commands, and alarms\n- Automatic generation of commands and alarms for enhanced user convenience',
                        archive: 'Planned and constructed by myself.',
                        url: '',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProjectCardForm(
                        image: 'lib/images/canelDeer.jpeg',
                        title: 'Canel Deer',
                        skills: canelDeerSkillsList,
                        desc:
                            'The Canel Deer website stands as a dynamic e-commerce platform, meticulously designed to cater to the health supplement market.',
                        feature:
                            '- Utilizing the robust capabilities of WooCommerce.\n- The website is crafted by using Elementor, ensuring an aesthetically pleasing and user-friendly interface.\n- Canel Deer is seamlessly linked with Stripe for payment processing.',
                        archive: '',
                        url: 'https://caneldeer.ca/',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProjectCardForm(
                        image: 'lib/images/umeSushi.jpeg',
                        title: 'Ume Sushi',
                        skills: umeSushiSkillsList,
                        desc:
                            'The Ume Sushi website represents a seamless online ordering platform, tailored to enhance the convenience of sushi enthusiasts. ',
                        feature:
                            '- Ume Sushi ensures a user-friendly and efficient online ordering experience.\n- The website is crafted by using Elementor, ensuring an aesthetically pleasing and user-friendly interface.\n- Ume Sushi is seamlessly linked with Stripe for payment processing.',
                        archive: 'Planned and constructed by myself.',
                        url: 'https://umesushi.ca/',
                      ),
                      SizedBox(
                        height: 80,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 1000,
                        child: Text(
                          'I initially overlooked the importance of addressing faults in my endeavors, resulting in the gradual deterioration of my achievements. It wasn\'t until I delved into coding that I realized the pivotal role debugging plays in crafting successful projects. Embarking on my coding journey, I encountered debugging challenges that initially induced stress and consumed significant time. Despite the initial hardships, I soon recognized that debugging is not just a problem-solving process; it is an essential component of the journey toward success. Overcoming these challenges has made me resilient and well-versed in various debugging techniques.',
                          style: AppTextStyles.aboutStyle(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 1000,
                        child: Text(
                          'In reflecting on my coding journey, I\'ve come to recognize the second most crucial aspect in coding: pseudocode. I admit that, like many during their early years in coding, I was initially unaware of the significance of pseudocode. This lack of awareness led to inefficiencies in my work. In the absence of proper design during coding, the modeling became inaccurate, resulting in errors within the functions. Consequently, multiple revisions were necessary to align with the intended design. . In response, I delved into a comprehensive study to master the effective design of pseudocode, understanding that continuous learning is indispensable for my growth as a developer.',
                          style: AppTextStyles.aboutStyle(),
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                    ],
                  ),
                  const Column(
                    children: [
                      ExperienceCardForm(
                        period: 'Apr 2023 – Present',
                        company: 'Webonology',
                        position: 'Web Developer',
                        desc:
                            'Webonology was founded in 2016 with the goal of helping businesses in Canada of all sizes establish a strong online presence. We understand the importance of having a website that not only looks professional, but also functions seamlessly and effectively. With a team of skilled designers and developers, we have the expertise to bring your vision to life on the web.',
                        url: 'https://webonology.ca/',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ExperienceCardForm(
                        period: 'Dec 2018 – Dec 2021',
                        company: 'Aeropol Aviation Service',
                        position: 'Hydraulic/Landing Gear Technician',
                        desc:
                            'Aeropol Aviation Services Corporation (Aeropol) is a Canadian owned and Approved Maintenance Organization (AMO) providing quality driven aircraft component Maintenance, Repair and Overhaul (MRO), Component Distribution and Non-Destructive Testing (NDT) Inspection services to meet the most demanding standards of the aerospace industry.',
                        url: 'http://www.aeropol.com/',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ExperienceCardForm(
                        period: 'Jun 2015 – Mar 2017',
                        company: 'Republic of Korea Army (ROKA)',
                        position: 'UH-60 Technician and Flight Crew',
                        desc: '',
                        url: 'https://www.army.mil.kr/sites/army/index.do',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      EducationCardForm(
                          period: 'Jan 2022 – Apr 2023',
                          status: 'Graduated',
                          school: 'Seneca College',
                          major: 'Computer Programming'),
                      EducationCardForm(
                          period: 'Sep 2012 – Jun 2018',
                          status: 'Graduated',
                          school: 'Centennial College',
                          major: 'Aviation Maintenance'),
                    ],
                  ),
                ],
              ),
            )
          : Container(
              child: AnchorTab(
                tabs: [
                  'Projects',
                  'About',
                  'Experiences',
                ],
                key: UniqueKey(),
                body: [
                  Column(
                    children: [
                      MobileProjectCardForm(
                        title: 'Webonology CRM',
                        skills: CRMSkillsList,
                        desc:
                            'Webonology CRM is a comprehensive web application tailored to meet the unique needs of nail and hair salons, providing an efficient Customer Relationship Management (CRM) solution.',
                        feature:
                            '- Seamlessly handle bookings with an intuitive system. \n- Keep track of customer information, preferences, and history.\n- Easily manage and update the range of services offered by the salon.\n- Streamline staff information and schedules for optimal resource utilization.',
                        archive:
                            'Co-initiated and co-operated, most of front end, language setting, parts of back end.',
                        url: 'https://crm.webonology.ca/',
                        layoutSize: 700,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MobileProjectCardForm(
                        title: 'Command Accepted',
                        skills: commacSkillsList,
                        desc:
                            'Command Accepted is a user-friendly application designed for seamless command exchange among individuals.',
                        feature:
                            '- One-click command exchange\n- Seamless integration with mobile calendars\n- Firebase-powered database for reliability\n- Unique \'uid\' for users, commands, and alarms\n- Automatic generation of commands and alarms for enhanced user convenience',
                        archive: 'Planned and constructed by myself.',
                        url: 'https://crm.webonology.ca/',
                        layoutSize: 700,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MobileProjectCardForm(
                        title: 'Canel Deer',
                        skills: canelDeerSkillsList,
                        desc:
                            'The Canel Deer website stands as a dynamic e-commerce platform, meticulously designed to cater to the health supplement market.',
                        feature:
                            '- Utilizing the robust capabilities of WooCommerce.\n- The website is crafted by using Elementor, ensuring an aesthetically pleasing and user-friendly interface.\n- Canel Deer is seamlessly linked with Stripe for payment processing.',
                        archive: 'Co-initiated and co-operated.',
                        url: 'https://caneldeer.ca/',
                        layoutSize: 700,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MobileProjectCardForm(
                        title: 'Ume Sushi',
                        skills: umeSushiSkillsList,
                        desc:
                            'The Ume Sushi website represents a seamless online ordering platform, tailored to enhance the convenience of sushi enthusiasts. ',
                        feature:
                            '- Ume Sushi ensures a user-friendly and efficient online ordering experience.\n- The website is crafted by using Elementor, ensuring an aesthetically pleasing and user-friendly interface.\n- Ume Sushi is seamlessly linked with Stripe for payment processing.',
                        archive: 'Planned and constructed by myself.',
                        url: 'https://umesushi.ca/',
                        layoutSize: 700,
                      ),
                      SizedBox(
                        height: 80,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 1000,
                        child: Text(
                          'I initially overlooked the importance of addressing faults in my endeavors, resulting in the gradual deterioration of my achievements. It wasn\'t until I delved into coding that I realized the pivotal role debugging plays in crafting successful projects. Embarking on my coding journey, I encountered debugging challenges that initially induced stress and consumed significant time. Despite the initial hardships, I soon recognized that debugging is not just a problem-solving process; it is an essential component of the journey toward success. Overcoming these challenges has made me resilient and well-versed in various debugging techniques.',
                          style: AppTextStyles.aboutStyle(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 1000,
                        child: Text(
                          'In reflecting on my coding journey, I\'ve come to recognize the second most crucial aspect in coding: pseudocode. I admit that, like many during their early years in coding, I was initially unaware of the significance of pseudocode. This lack of awareness led to inefficiencies in my work. In the absence of proper design during coding, the modeling became inaccurate, resulting in errors within the functions. Consequently, multiple revisions were necessary to align with the intended design. . In response, I delved into a comprehensive study to master the effective design of pseudocode, understanding that continuous learning is indispensable for my growth as a developer.',
                          style: AppTextStyles.aboutStyle(),
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                    ],
                  ),
                  const Column(
                    children: [
                      MobileExperienceCardForm(
                        period: 'Apr 2023 – Present',
                        company: 'Webonology',
                        position: 'Web Developer',
                        desc:
                            'Webonology was founded in 2016 with the goal of helping businesses in Canada of all sizes establish a strong online presence. We understand the importance of having a website that not only looks professional, but also functions seamlessly and effectively. With a team of skilled designers and developers, we have the expertise to bring your vision to life on the web.',
                        url: 'https://webonology.ca/',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MobileExperienceCardForm(
                        period: 'Dec 2018 – Dec 2021',
                        company: 'Aeropol Aviation Service',
                        position: 'Hydraulic/Landing Gear Technician',
                        desc:
                            'Aeropol Aviation Services Corporation (Aeropol) is a Canadian owned and Approved Maintenance Organization (AMO) providing quality driven aircraft component Maintenance, Repair and Overhaul (MRO), Component Distribution and Non-Destructive Testing (NDT) Inspection services to meet the most demanding standards of the aerospace industry.',
                        url: 'http://www.aeropol.com/',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MobileExperienceCardForm(
                        period: 'Jun 2015 – Mar 2017',
                        company: 'Republic of Korea Army (ROKA)',
                        position: 'UH-60 Technician and Flight Crew',
                        desc: '',
                        url: 'https://www.army.mil.kr/sites/army/index.do',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MobileEducationCardForm(
                          period: 'Jan 2022 – Apr 2023',
                          status: 'Graduated',
                          school: 'Seneca College',
                          major: 'Computer Programming'),
                      MobileEducationCardForm(
                          period: 'Sep 2012 – Jun 2018',
                          status: 'Graduated',
                          school: 'Centennial College',
                          major: 'Aviation Maintenance'),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
