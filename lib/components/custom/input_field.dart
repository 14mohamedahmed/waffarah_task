import 'package:flutter/material.dart';
import 'package:waffaraha_task/core/utils/app_colors.dart';

class InputField extends StatefulWidget {
  final TextEditingController inputController;
  final bool autofocus, enableEdit, readOnly;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final Function()? onTapEndIcon;
  final double borderRadius, borderThickness;
  final Color borderColor;
  final String? labelText, hintText;
  final IconData? endIcon;
  final Color? endIconColor;
  final AlignmentGeometry endIconAlignment;
  final bool endIconLoading;
  final double endIconMaxHeight;
  final int maxLines;
  final TextInputType? keyboardType;
  final AutovalidateMode autovalidateMode;
  const InputField({
    super.key,
    required this.inputController,
    this.validator,
    this.endIconMaxHeight = 48,
    this.keyboardType = TextInputType.text,
    this.onTapEndIcon,
    this.readOnly = false,
    this.autofocus = false,
    this.enableEdit = true,
    this.borderThickness = 1,
    this.borderRadius = 0,
    this.borderColor = Colors.transparent,
    this.hintText,
    this.labelText,
    this.onChanged,
    this.endIconAlignment = Alignment.center,
    this.endIcon,
    this.endIconColor,
    this.endIconLoading = false,
    this.maxLines = 1,
    this.autovalidateMode = AutovalidateMode.disabled,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late final bool isPasswordField =
      widget.endIcon == Icons.remove_red_eye_outlined;
  late bool hidePassword = isPasswordField;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.inputController,
      autofocus: widget.autofocus,
      validator: widget.validator,
      autovalidateMode: widget.autovalidateMode,
      onTap: () {
        if (widget.endIconLoading) return;
        if (widget.onTapEndIcon != null) widget.onTapEndIcon!();
      },
      obscureText: hidePassword,
      style: TextStyle(
        color: !widget.enableEdit ? Colors.grey.shade400 : Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      cursorColor: Colors.black,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines,
      readOnly: widget.readOnly,
      canRequestFocus: !widget.readOnly,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        isDense: true,
        enabled: widget.enableEdit,
        hintText: widget.hintText,
        floatingLabelStyle: const TextStyle(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w500,
        ),
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
          fontWeight: FontWeight.w500,
        ),
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: Colors.grey.shade400,
          fontWeight: FontWeight.w500,
        ),
        alignLabelWithHint: true,
        border: _inputBorder(),
        enabledBorder: _inputBorder(),
        disabledBorder: _inputBorder(),
        focusedBorder: _inputBorder(),
        suffixIconConstraints: BoxConstraints(
          maxWidth: 48,
          minHeight: widget.endIconMaxHeight,
        ),
        errorStyle: const TextStyle(color: Colors.red),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        suffixIcon: Container(
          alignment: widget.endIconAlignment,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Visibility(
            visible: widget.endIcon != null,
            child: GestureDetector(
              onTap: () {
                if (widget.endIconLoading) return;
                if (isPasswordField) {
                  // this mean it's password
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                }
                if (widget.onTapEndIcon != null) widget.onTapEndIcon!();
              },
              child: widget.endIconLoading
                  ? const SizedBox(
                      width: 17,
                      height: 17,
                      child: CircularProgressIndicator.adaptive(strokeWidth: 2),
                    )
                  : Icon(
                      !isPasswordField
                          ? widget.endIcon
                          : hidePassword
                              ? Icons.remove_red_eye
                              : widget.endIcon,
                      color: !isPasswordField
                          ? widget.endIconColor ?? Colors.grey.shade500
                          : hidePassword
                              ? Colors.grey.shade500
                              : AppColors.primaryColor,
                      size: 25,
                    ),
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _inputBorder() {
    return OutlineInputBorder(
      borderSide:
          BorderSide(color: widget.borderColor, width: widget.borderThickness),
      borderRadius: BorderRadius.circular(widget.borderRadius),
    );
  }
}
