import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/business_logic/app_cubit.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

import '../../model/welcome_data_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var exploreItems = {
    'balloning.png': 'Balloning',
    'hiking.png': 'Hiking',
    'kayaking.png': 'Kayaking',
    'snorkling.png': 'Snorkling',
  };

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          if(state is LoadedState) {
            List<DataModel> info = state.places;
            return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.menu,
                        size: 30,
                        color: Colors.black,
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.5)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  AppLargeText(text: 'Discover '),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      labelPadding: const EdgeInsets.only(right: 20),
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator:
                      CircleIndicator(color: AppColors.mainColor, radius: 4),
                      controller: tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      tabs: const [
                        Tab(
                          text: 'Places',
                        ),
                        Tab(
                          text: 'Inspiration',
                        ),
                        Tab(
                          text: 'Emotions',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(),
                    height: 300,
                    width: double.maxFinite,
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        buildTabItem(info),
                        Text('HI2'),
                        Text('HI3'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLargeText(
                        text: 'Explore More',
                        size: 22,
                      ),
                      AppText(
                        text: 'See All',
                        color: AppColors.textColor1,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 120,
                    width: double.maxFinite,
                    child: ListView.separated(
                      itemCount: exploreItems.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return buildExploreItem(index);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 30,);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
          }else{
            return Container();
          }
        },
      ),
    );
  }

  Widget buildTabItem(List<DataModel> list) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
            AppCubit.get(context).goToDetailPage(list[index]);
          },
          child: Container(
            margin: const EdgeInsets.only(right: 15, top: 10),
            height: 300,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                image: DecorationImage(
                    image: NetworkImage('http://mark.bslmeiyu.com/uploads/${list[index].img}'),
                    fit: BoxFit.cover)),
          ),
        );
      },
      itemCount: list.length,
      scrollDirection: Axis.horizontal,
    );
  }

  Widget buildExploreItem(int index) {
    return Column(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage(
                      'assets/images/${exploreItems.keys.elementAt(index)}'),
                  fit: BoxFit.cover
              )
          ),
        ),
        const SizedBox(height: 10,),
        AppText(text: exploreItems.values.elementAt(index),
          color: AppColors.textColor2,),
      ],
    );
  }
}

class CircleIndicator extends Decoration {
  final Color color;
  final double radius;

  const CircleIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return CirclePainter(color: color, radius: radius);
  }
}

class CirclePainter extends BoxPainter {
  final Color color;
  final double radius;

  const CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // TODO: implement paint
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
