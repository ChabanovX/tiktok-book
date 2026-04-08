import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/core/theme/theme.dart';
import 'package:rsvp_flutter_app/features/rsvp_reading/reading_speed.dart';
import 'package:rsvp_flutter_app/l10n/l10n.dart';

Future<void> showMaterialSpeedPicker(
  BuildContext context,
  int wpm,
  ValueChanged<int> onChangeWpm,
) async {
  var selectedWpm = wpm;
  final initialIndex = readingSpeedOptions.indexOf(wpm);
  final pickerController = FixedExtentScrollController(
    initialItem: initialIndex >= 0 ? initialIndex : 0,
  );
  final appTheme = context.appTheme;

  await showModalBottomSheet<void>(
    context: context,
    backgroundColor: appTheme.backgroundColor2,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
    ),
    builder: (context) {
      final l10n = context.l10n;
      return StatefulBuilder(
        builder: (context, setModalState) {
          return SafeArea(
            top: false,
            child: SizedBox(
              height: 320,
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Container(
                    width: 44,
                    height: 4,
                    decoration: BoxDecoration(
                      color: appTheme.dividerColorMuted,
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                    child: Row(
                      children: [
                        Text(
                          l10n.readingSpeedPickerTitle,
                          style: appTheme.buttonTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '$selectedWpm WPM',
                          style: appTheme.subTextStyle.copyWith(
                            color: appTheme.secondaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListWheelScrollView.useDelegate(
                      controller: pickerController,
                      itemExtent: 48,
                      diameterRatio: 1.25,
                      physics: const FixedExtentScrollPhysics(),
                      onSelectedItemChanged: (index) {
                        setModalState(() {
                          selectedWpm = readingSpeedOptions[index];
                        });
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: readingSpeedOptions.length,
                        builder: (context, index) {
                          final value = readingSpeedOptions[index];
                          final isSelected = value == selectedWpm;

                          return Center(
                            child: Text(
                              '$value WPM',
                              style: appTheme.buttonTextStyle.copyWith(
                                fontSize: isSelected ? 24 : 20,
                                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                                color: isSelected ? appTheme.mainTextStyle.color : appTheme.subTextStyle.color,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text(l10n.commonCancel),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: FilledButton(
                            onPressed: () {
                              onChangeWpm(selectedWpm);
                              Navigator.of(context).pop();
                            },
                            child: Text(l10n.commonDone),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
