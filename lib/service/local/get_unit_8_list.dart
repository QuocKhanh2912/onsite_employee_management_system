import 'package:flutter/services.dart';

class GetUnit8List {
 static Future<Uint8List> getImageBytesFromAsset(String assetPath) async {
    final ByteData byteData = await rootBundle.load(assetPath);
    return byteData.buffer.asUint8List();
  }
}