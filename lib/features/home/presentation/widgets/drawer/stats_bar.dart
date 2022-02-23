import 'package:easy2know_flutter/core/constants/constants.dart';
import 'package:flutter/material.dart';

class ProjectStatsBar extends StatelessWidget {
  final int currentValue;
  final int maxValue;
  final String valueName;
  final Color color;

  const ProjectStatsBar(
      {Key key, this.currentValue, this.maxValue, this.valueName, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double chartValue = currentValue / maxValue;

    return Row(
      children: <Widget>[
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
//                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: AppColors.card_background_grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: FractionallySizedBox(
                  heightFactor: chartValue,
                  child: Container(
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 40),
        Flexible(
          fit: FlexFit.tight,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(valueName),
                SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '$currentValue',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 6),
                    Text('/'),
                    SizedBox(width: 6),
                    Text('$maxValue'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
