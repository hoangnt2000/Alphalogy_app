// import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart ' as Rating2;

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            RatingBar(
              filledIcon: Icons.star,
              filledColor: Colors.amber,
              emptyIcon: Icons.star_border,
              onRatingChanged: (value) {
                controller.index.value = value as int;
              },
              initialRating: 0,
              alignment: Alignment.center,
              size: 50,
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => IndexedStack(
                index: controller.index.value,
                children: [
                  buildText(title: "Rating 0"),
                  buildText(title: "Rating 1"),
                  buildText(title: "Rating 2"),
                  buildText(title: "Rating 3"),
                  buildText(title: "Rating 4"),
                  buildText(title: "Rating 5"),
                ],
              ),
            ),
            const Divider(),
            Rating2.RatingBar.builder(
              initialRating: 0,
              minRating: 0,
              allowHalfRating: false,
              unratedColor: Colors.grey.withAlpha(50),
              itemCount: 5,
              itemSize: 50.0,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                controller.index2.value = rating as int;
              },
              updateOnDrag: false,
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => IndexedStack(
                index: controller.index2.value,
                children: [
                  buildRatingWidget(
                    image: "image/ic_rate_0.png",
                    titleText: "Do you Like app ?",
                    bodyText: 'Let us know you experience',
                  ),
                  buildRatingWidget(
                    image: "image/ic_rate_1.png",
                    titleText: "Oh, Noooo",
                    bodyText: 'Let us know you experience',
                  ),
                  buildRatingWidget(
                    image: "image/ic_rate_2.png",
                    titleText: "Oh, No",
                    bodyText: 'Let us know you experience 2',
                  ),
                  buildRatingWidget(
                    image: "image/ic_rate_3.png",
                    titleText: "Oh, No",
                    bodyText: 'Please give us some feedback',
                  ),
                  buildRatingWidget(
                    image: "image/ic_rate_4.png",
                    titleText: "We love you too!",
                    bodyText: 'thanks your feedback',
                  ),
                  buildRatingWidget(
                    image: "image/ic_rate_5.png",
                    titleText: "We love you too00!",
                    bodyText: 'thanks your feedback',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            buildRating(),
          ],
        ),
      ),
    );
  }

  Widget buildText({
    required String title,
  }) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.amber,
        fontSize: 20,
      ),
    );
  }

  Widget buildRatingWidget({
    required String image,
    required String titleText,
    required String bodyText,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Image.asset(
            image,
            height: 50,
            width: 50,
          ),
          Text(
            titleText,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            bodyText,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRating() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(30),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                controller.isSelected.value = !controller.isSelected.value;
              },
              child: controller.isSelected.value
                  ? const Icon(
                      Icons.star,
                      size: 50,
                      color: Colors.amber,
                    )
                  : const Icon(
                      Icons.star_border,
                      size: 50,
                      color: Colors.grey,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
