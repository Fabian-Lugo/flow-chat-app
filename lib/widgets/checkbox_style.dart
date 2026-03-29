import 'package:flow_chat/theme/app_colors.dart';
import 'package:flow_chat/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class CheckboxStyle extends StatefulWidget {
  final String text;
  final bool terms;

  const CheckboxStyle({
    this.text = '',
    this.terms = false, 
    super.key
  });

  @override
  State<CheckboxStyle> createState() => _CheckboxStyleState();
}

class _CheckboxStyleState extends State<CheckboxStyle> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Checkbox(
            value: value,
            activeColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            side: const BorderSide(color: AppColors.surfaceDark, width: 2),
            onChanged: (bool? newValue) => setState(() {
              value = newValue!;
            }),
          ),
        ),
        const SizedBox(width: 8),
        widget.terms 
        ? Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Acepta los ',
                  style: AppTextStyle.checkboxText,
                ),
                TextSpan(
                  text: 'Terminos ',
                  style: AppTextStyle.linkText,
                ),
                TextSpan(
                  text: 'y ',
                  style: AppTextStyle.checkboxText,
                ),
                TextSpan(
                  text: 'Condiciones',
                  style: AppTextStyle.linkText,
                ),
              ],
            ),
          )
        : Text(widget.text, style: AppTextStyle.checkboxText),
      ],
    );
  }
}
