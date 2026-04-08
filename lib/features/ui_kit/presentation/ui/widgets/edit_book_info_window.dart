import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/core/theme/theme.dart';
import 'package:rsvp_flutter_app/l10n/l10n.dart';

class EditBookInfoWindow extends StatefulWidget {
  const EditBookInfoWindow({
    required this.onSubmit,
    this.initialTitle,
    this.initialAuthor,
    super.key,
  });

  final void Function(String? newName, String? newAuthor) onSubmit;
  final String? initialTitle;
  final String? initialAuthor;

  @override
  State<EditBookInfoWindow> createState() => _EditBookInfoWindowState();
}

class _EditBookInfoWindowState extends State<EditBookInfoWindow> {
  late final TextEditingController _titleController;
  late final TextEditingController _authorController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.initialTitle ?? '');
    _authorController = TextEditingController(text: widget.initialAuthor ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;
    final l10n = context.l10n;
    final viewInsets = MediaQuery.viewInsetsOf(context);
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: appTheme.dividerColorMuted),
    );

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        padding: EdgeInsets.only(bottom: viewInsets.bottom),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: appTheme.backgroundColor2,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: appTheme.secondaryColor.withValues(alpha: 0.18)),
              boxShadow: [
                BoxShadow(
                  color: appTheme.primaryColor.withValues(alpha: 0.12),
                  blurRadius: 28,
                  offset: const Offset(0, 14),
                ),
                BoxShadow(
                  color: appTheme.stateCardShadowColor,
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 18),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.bookEditTitle,
                    style: appTheme.titleTextStyle.copyWith(fontSize: 22),
                  ),
                  const SizedBox(height: 18),
                  TextField(
                    controller: _titleController,
                    autofocus: true,
                    textInputAction: TextInputAction.next,
                    style: appTheme.mainTextStyle,
                    decoration: InputDecoration(
                      labelText: l10n.bookEditNameLabel,
                      labelStyle: appTheme.subTextStyle,
                      filled: true,
                      fillColor: appTheme.backgroundColor,
                      enabledBorder: inputBorder,
                      focusedBorder: inputBorder.copyWith(
                        borderSide: BorderSide(color: appTheme.secondaryColor, width: 1.5),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  TextField(
                    controller: _authorController,
                    textInputAction: TextInputAction.done,
                    style: appTheme.mainTextStyle,
                    onSubmitted: (_) => _submit(),
                    decoration: InputDecoration(
                      labelText: l10n.bookEditAuthorLabel,
                      labelStyle: appTheme.subTextStyle,
                      filled: true,
                      fillColor: appTheme.backgroundColor,
                      enabledBorder: inputBorder,
                      focusedBorder: inputBorder.copyWith(
                        borderSide: BorderSide(color: appTheme.secondaryColor, width: 1.5),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size.fromHeight(48),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            side: BorderSide(color: appTheme.dividerColorMuted),
                            foregroundColor: appTheme.primaryColor,
                            textStyle: appTheme.mainTextStyle.copyWith(fontWeight: FontWeight.w700),
                          ),
                          child: Text(l10n.cancel),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: FilledButton(
                          onPressed: _submit,
                          style: FilledButton.styleFrom(
                            minimumSize: const Size.fromHeight(48),
                            backgroundColor: appTheme.secondaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            textStyle: appTheme.mainTextStyle.copyWith(fontWeight: FontWeight.w700),
                          ),
                          child: Text(l10n.done),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    widget.onSubmit(_titleController.text, _authorController.text);
    Navigator.of(context).pop();
  }
}
