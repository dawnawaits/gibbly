import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class MeasureCard extends StatelessWidget {
  const MeasureCard({
    @required this.text,
    @required this.values,
  });

  final String text;
  final List<String> values;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18.0),
      margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: values.map((e) => ValueBox(value: e)).toList(),
          ),
        ],
      ),
    );
  }
}

class ValueBox extends StatelessWidget {
  const ValueBox({
    @required this.value,
  });

  final String value;

  @override
  Widget build(BuildContext context) {
    const double size = 58.0;

    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: const Color(0xFF0A122A),
      ),
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Center(
        child: Text(
          value,
          style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
