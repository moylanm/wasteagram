import 'package:intl/intl.dart';

class Entry {
  final String date;
  final String imageURL;
  final String quantity;
  final String latitude;
  final String longitude;

  Entry(this.date, this.imageURL, this.quantity, this.latitude, this.longitude);

  Entry.fromMap(Map<String, dynamic> map) :
    date = DateFormat('EEEE, MMMM d, y').format(map['date'].toDate()),
    imageURL = map['imageURL'],
    quantity = map['quantity'].toString(),
    latitude = map['latitude'],
    longitude = map['longitude'];
}