import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui/common/app_colors.dart';

import '../widgets/level_description.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(
                  'assets/images/everyday-driving.jpg',
                  color: AppColors.mainBackground.withOpacity(0.7),
                  colorBlendMode: BlendMode.modulate,
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35, top: 55),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SvgPicture.asset(
                        'assets/images/car-sideview.svg',
                        color: Colors.white,
                        height: 36,
                        width: 36,
                      ),
                      const Divider(
                        color: Colors.amber,
                        endIndent: 310,
                        thickness: 1.5,
                      ),
                      const Text(
                        'Introduction \nto Driving',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const LevelDescription(level: 'Beginner'),
                          Container(
                            margin: const EdgeInsets.only(right: 60),
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 5, bottom: 5),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(7)),
                            child: const Text(
                              '\$20',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(40),
              child: Text(
                "Start by taking a couple of minutes to read the info in this section you'll find that it is time well spent. For many young people, learning to drive and being in charge of a motor vehicle will be the biggest responsibility in their lives so far. But with help from a good driving coach you will soon be taking it all in your stride.",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.mainBackground
                ),
                onPressed: () {},
                child: const Text(
                  'TAKE THIS LESSON',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
