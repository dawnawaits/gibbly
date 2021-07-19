import 'package:flutter/material.dart';
import 'package:gibbly/providers/prefs.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';

class IntroPage extends StatelessWidget {
  final pages = [
    const _CustomPage(
      title: 'Accelerometer',
      image: 'assets/accelerometer.png',
      body:
          "Measures acceleration of motion of the device, ie, change in the velocity of the device. \n\nUser accelerometer shows values that donot consider gravity.",
    ),
    const _CustomPage(
      title: 'Gyroscope',
      image: 'assets/gyroscope.png',
      body:
          "Measures the angular velocity of the device at any given instance, ie, how fast the device the device is rotating around its axis.\n\nShows result with respect to x, y and z axes.",
    ),
    const _CustomPage(
      title: 'Values',
      image: 'assets/values.png',
      body:
          'Sensor Name: Denotes sensor\nX: Value with respect to x axis\nY: Value with respect to y axis\nZ: Value with respect to z axis',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final prefs = Provider.of<Prefs>(context, listen: false);
    return IntroductionScreen(
      rawPages: pages,
      showNextButton: false,
      done: Text(
        "Done",
        style: Theme.of(context).textTheme.bodyText2,
      ),
      onDone: () {
        prefs.setIntroShown();
      },
      dotsDecorator: const DotsDecorator(
        color: Color(0xFF0A122A),
        activeColor: Color(0xFFF42C04),
      ),
    );
  }
}

class _CustomPage extends StatelessWidget {
  const _CustomPage({
    @required this.title,
    @required this.image,
    @required this.body,
  });

  final String title;
  final String image;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(title, style: Theme.of(context).textTheme.headline4),
          ),
        ),
        const SizedBox(height: 10.0),
        Expanded(
          child: Image.asset(image),
        ),
        Expanded(
          flex: 2,
          child: Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Text(
              body,
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
