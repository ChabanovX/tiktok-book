import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/features/rsvp_reading/presentation/ui/widgets/cupertino_picker.dart';
import 'package:rsvp_flutter_app/features/rsvp_reading/presentation/ui/widgets/material_picker.dart';

Future<void> showAdaptiveSpeedPicker(
  BuildContext context,
  int wpm,
  ValueChanged<int> onChangeWpm,
) async {
  final platform = Theme.of(context).platform;
  if (platform == TargetPlatform.iOS || platform == TargetPlatform.macOS) {
    await showCupertinoSpeedPicker(context, wpm, onChangeWpm);
    return;
  }

  await showMaterialSpeedPicker(context, wpm, onChangeWpm);
}
