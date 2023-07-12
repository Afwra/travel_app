import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/business_logic/app_cubit.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_buttons.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int starsCount = 3;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        DetailState info = state as DetailState;
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SizedBox(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration:  BoxDecoration(
                      image: DecorationImage(
                          image:
                              NetworkImage('http://mark.bslmeiyu.com/uploads/${info.places.img}'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        IconButton(
                          onPressed: () {
                            AppCubit.get(context).goToHomePage();
                          },
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 310,
                    child: Container(
                      padding: const EdgeInsets.only(
                          right: 20, left: 20, top: 30),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height - 310,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              AppLargeText(
                                text: info.places.name.toString(),
                                color: Colors.black.withOpacity(0.8),
                              ),
                              AppLargeText(
                                text: '\$'+info.places.price.toString(),
                                color: AppColors.mainColor,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: AppColors.mainColor,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              AppText(
                                text: '${info.places.location}',
                                color: AppColors.textColor1,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Wrap(
                                children: List.generate(
                                  5,
                                  (index) {
                                    return Icon(
                                      Icons.star,
                                      color: info.places.stars! > index
                                          ? AppColors.starColor
                                          : AppColors.textColor2,
                                      size: 20,
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              AppText(
                                text: '(${info.places.stars}.0)',
                                color: AppColors.textColor2,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          AppLargeText(
                            text: 'People',
                            color: Colors.black.withOpacity(0.8),
                            size: 20,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          AppText(
                            text: 'Number of people in your group',
                            color: AppColors.mainTextColor,
                            size: 14,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Wrap(
                            children: List.generate(
                              5,
                              (index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        right: 10),
                                    child: AppButton(
                                      width: 60,
                                      height: 60,
                                      itemSize: 50,
                                      backgroundColor: selectedIndex ==
                                              index
                                          ? Colors.black
                                          : AppColors.buttonBackground,
                                      borderColor: selectedIndex ==
                                              index
                                          ? Colors.black
                                          : AppColors.buttonBackground,
                                      text: (index + 1).toString(),
                                      textColor: selectedIndex == index
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AppLargeText(
                            text: 'Description',
                            color: Colors.black.withOpacity(0.8),
                            size: 20,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          AppText(
                            text: info.places.description.toString(),
                            color: AppColors.mainTextColor,
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 50),
                            child: Row(
                              children: [
                                AppButton(
                                    width: 60,
                                    height: 60,
                                    itemSize: 15,
                                    backgroundColor: Colors.white,
                                    borderColor: AppColors.textColor2,
                                    isIcon: true,
                                    icon: Icons.favorite_border,
                                    itemColor: AppColors.textColor1),
                                const SizedBox(
                                  width: 20,
                                ),
                                const ResponsiveButton(
                                  width: double.maxFinite,
                                  isResponsive: true,
                                )
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
