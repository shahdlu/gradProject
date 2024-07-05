import 'package:flutter/material.dart';
import '../theme/constants.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({
    super.key,
    required this.checkboxTitle,
    required this.checkboxtitleWidget,
    required this.isChecked,
    required this.onChanged,
  });
  final String checkboxTitle;
  final Widget checkboxtitleWidget;
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      activeColor: kButtonColor,
      checkboxShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      controlAffinity: ListTileControlAffinity.leading,
      title: widget.checkboxtitleWidget,
      value: widget.isChecked,
      onChanged: (val) {
        if (val != null) {
          widget.onChanged(val);
        }
      },
    );
  }
}
