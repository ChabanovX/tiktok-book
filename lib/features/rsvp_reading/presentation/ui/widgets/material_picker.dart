import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/core/theme/theme.dart';

const List<int> _speedOptions = [200, 250, 300, 350, 400, 450, 500, 550, 600];

Future<void> showMaterialSpeedPicker(
  BuildContext context,
  int wpm,
  ValueChanged<int> onChangeWpm,
) async {
  var selectedWpm = wpm;
  final initialIndex = _speedOptions.indexOf(wpm);
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
                          'Reading speed',
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
                          selectedWpm = _speedOptions[index];
                        });
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: _speedOptions.length,
                        builder: (context, index) {
                          final value = _speedOptions[index];
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
                            child: const Text('Cancel'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: FilledButton(
                            onPressed: () {
                              onChangeWpm(selectedWpm);
                              Navigator.of(context).pop();
                            },
                            child: const Text('Done'),
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
