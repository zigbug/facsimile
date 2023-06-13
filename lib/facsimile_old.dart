// library facsimile;

// import 'dart:typed_data';
// import 'package:image/image.dart' as img;

// class Facsimile {
//   Future<Uint8List?> removeBackground(Uint8List bytes) async {
//     img.Image? image = img.decodeImage(bytes);
//     img.Image? transparentImage =
//         await _colorTransparent(image!, 150, 150, 150);
//     var newPng = img.encodePng(transparentImage!);
//     Uint8List unit8list = Uint8List.fromList(newPng);
//     return unit8list;
//   }

//   Future<img.Image?> _colorTransparent(
//       img.Image src, int red, int green, int blue) async {
//     var bytes = src.getBytes();
//     for (int i = 0, len = bytes.length; i < len; i += 4) {
//       if ((bytes[i] > red && bytes[i + 1] > green && bytes[i + 2] > blue)) {
//         bytes[i + 3] = 0;
//       } else if (bytes[i + 2] < 20 && (bytes[i] > 20 || bytes[i + 1] > 20)) {
//         bytes[i + 3] = 0;
//       } else if ((bytes[i] > 127 && bytes[i + 2] > 127) &&
//           (bytes[i] - bytes[i + 2]) < 20) {
//         bytes[i + 3] = 0;
//       } else if (bytes[i] > 100) {
//         bytes[i + 3] = 0;
//       }
//     }

//     return img.Image.fromBytes(src.width, src.height, bytes);
//   }
// }
