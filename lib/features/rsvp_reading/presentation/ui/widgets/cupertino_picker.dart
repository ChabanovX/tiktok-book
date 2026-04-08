import 'package:flutter/cupertino.dart';
import 'package:rsvp_flutter_app/features/rsvp_reading/reading_speed.dart';
import 'package:rsvp_flutter_app/l10n/l10n.dart';

Future<void> showCupertinoSpeedPicker(
  BuildContext context,
  int wpm,
  ValueChanged<int> onChangeWpm,
) async {
  var selectedWpm = wpm;
  final initialIndex = readingSpeedOptions.indexOf(wpm);
  final pickerController = FixedExtentScrollController(
    initialItem: initialIndex >= 0 ? initialIndex : 0,
  );

  await showCupertinoModalPopup<void>(
    context: context,
    builder: (context) {
      final backgroundColor = CupertinoColors.systemBackground.resolveFrom(context);
      final separatorColor = CupertinoColors.separator.resolveFrom(context);
      final l10n = context.l10n;

      return StatefulBuilder(
        builder: (context, setModalState) {
          return Container(
            height: 300,
            color: backgroundColor,
            child: Column(
              children: [
                Container(
                  height: 52,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: separatorColor),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(l10n.commonCancel),
                      ),
                      Text(
                        l10n.readingSpeedPickerTitle,
                        style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          onChangeWpm(selectedWpm);
                          Navigator.of(context).pop();
                        },
                        child: Text(l10n.commonDone),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: CupertinoPicker(
                    scrollController: pickerController,
                    itemExtent: 44,
                    useMagnifier: true,
                    magnification: 1.06,
                    onSelectedItemChanged: (index) {
                      setModalState(() {
                        selectedWpm = readingSpeedOptions[index];
                      });
                    },
                    children: readingSpeedOptions
                        .map(
                          (value) => Center(
                            child: Text('$value WPM'),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
