import 'package:flutter/material.dart';

class SentimentBySourceWidget extends StatelessWidget {
  final String topicName;

  const SentimentBySourceWidget({Key key, this.topicName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(topicName),
    );
  }
}
