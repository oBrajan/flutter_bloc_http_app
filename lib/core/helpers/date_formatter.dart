import 'package:intl/intl.dart';

class DateFormatter {
  var formatter = new DateFormat('yMMMd');

  String formattedDate(int timestamp) {
    if (timestamp != null) {
      var createdDate = new DateTime.fromMillisecondsSinceEpoch(
        timestamp * 1000,
      );
      String formatted = formatter.format(createdDate);
      return formatted;
    }

    return '';
  }
}
