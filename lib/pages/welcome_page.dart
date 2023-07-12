import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

import '../business_logic/app_cubit.dart';



class WelcomePage extends StatelessWidget {
  final PageController _pageController = PageController();

  final List<String> images = [
    'welcome-one.png',
    'welcome-two.png',
    'welcome-three.png',
  ];

  final List<String> bodyTexts = [
    'Mountain hikes give you an incredible sense of freedom along with endurance test.',
    'Explore breathtaking landscapes, immerse yourself in vibrant cultures, and embark on unforgettable adventures with our travel app.',
    'Discover hidden gems, indulge in culinary delights, and create lifelong memories with our curated travel experiences.',
  ];

  WelcomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemBuilder: (context, index) {
          return buildPageItem(index,AppCubit.get(context));
        },
        itemCount: images.length,
        scrollDirection: Axis.vertical,
        controller: _pageController,
      ),
    );
  }

  Widget buildPageItem(int index,AppCubit cubit) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/${images[index]}'),
              fit: BoxFit.cover)),
      child: Container(
        margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppLargeText(text: 'Trips'),
                AppText(
                  text: 'Mountain',
                  size: 30,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 250,
                  child: AppText(
                    text: bodyTexts[index],
                    color: AppColors.textColor2,
                    size: 14,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ResponsiveButton(
                  width: 100,
                  onTap: () {
                    cubit.getData();
                  },
                ),
              ],
            ),
            Column(
              children: List.generate(
                3,
                (sliderIndex) => Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  width: 8,
                  height: index == sliderIndex ? 25 : 8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: index == sliderIndex
                          ? AppColors.mainColor
                          : AppColors.mainColor.withOpacity(0.2)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
