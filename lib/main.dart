import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'astromars.dart';

void main() {
  runApp(DevicePreview(
    builder: (BuildContext context) => const AstroMars(),
  ));
}
