import 'package:flutter/cupertino.dart';
import 'package:rsvp_flutter_app/l10n/l10n.dart';

const List<int> _speedOptions = [200, 250, 300, 350, 400, 450, 500, 550, 600];

Future<void> showCupertinoSpeedPicker(
  BuildContext context,
  int wpm,
  ValueChanged<int> onChangeWpm,
) async {
  var selectedWpm = wpm;
  final initialIndex = _speedOptions.indexOf(wpm);
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
                        child: Text(l10n.cancel),
                      ),
                      Text(
                        l10n.readingSpeed,
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
                        child: Text(l10n.done),
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
                        selectedWpm = _speedOptions[index];
                      });
                    },
                    children: _speedOptions
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
