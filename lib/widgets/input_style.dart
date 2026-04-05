import 'package:flow_chat/theme/app_colors.dart';
import 'package:flow_chat/utils/input_styles_border.dart';
import 'package:flow_chat/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class InputStyle extends StatefulWidget {
  final String title;
  final String labelText;
  final TextEditingController controller;
  final TextInputType type;
  final IconData useIcon;

  const InputStyle({
    super.key,
    required this.title,
    required this.labelText,
    required this.controller,
    required this.type,
    required this.useIcon,
  });

  @override
  State<InputStyle> createState() => _InputStyleState();
}

class _InputStyleState extends State<InputStyle> {
  final GlobalKey<FormFieldState> _fieldKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    final hasError = _fieldKey.currentState?.hasError ?? false;

    return Column(
      children: [
        Align(
          alignment: AlignmentGeometry.centerStart,
          child: Padding(
            padding: EdgeInsetsGeometry.only(bottom: 8),
            child: Text(widget.title, style: AppTextStyle.inputsTitle,),
          ),
        ),
        TextFormField(
          key: _fieldKey,
          controller: widget.controller,
          keyboardType: widget.type,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (value) {
            _fieldKey.currentState?.validate();
            setState(() {});
          },
          decoration: InputDecoration(
            hintText: widget.labelText,
            labelStyle: AppTextStyle.label,
            errorStyle: const TextStyle(height: 0.1, fontSize: 0),
            enabledBorder: InputStylesBorder.customBorder(color: AppColors.chatOffline),
            focusedBorder: InputStylesBorder.customBorder(color: AppColors.accentLight),
            errorBorder: InputStylesBorder.customBorder(color: AppColors.error),
            focusedErrorBorder: InputStylesBorder.customBorder(color: AppColors.error),
            prefixIcon: Align(
              alignment: AlignmentGeometry.centerLeft,
              widthFactor: 1,
              child: Padding(
                padding: EdgeInsets.only(left: 12),
                child: Icon(widget.useIcon),
              ),
            ),
            suffixIcon: Align(
              alignment: AlignmentGeometry.centerRight,
              widthFactor: 1,
              child: Padding(
                padding: EdgeInsets.only(right: 12),
                child: hasError
                  ? const Icon(
                      Icons.error,
                      color: AppColors.error,
                    )  
                    : null,
              ),
            ),
          ),
          validator: (value) =>
            (value?.trim().isEmpty ?? true) 
              ? '' 
              : null,
        ),
      ],
    );
  }
}
