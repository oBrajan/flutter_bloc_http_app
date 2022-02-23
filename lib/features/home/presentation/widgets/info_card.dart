import 'package:easy2know_flutter/core/constants/constants.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final int value;
  final String text;
  final Color color;

  const InfoCard({
    Key key,
    @required this.value,
    @required this.text,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: value > 0 ? color : AppColors.card_background_grey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          "$value $text",
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
