import 'package:recite_flutter/theme.dart';

import 'base_button.dart';

class PrimaryButton extends BaseButton {
  PrimaryButton({text, onPressed})
      : super(
            text: text,
            onPressed: onPressed,
            backgroundColor: AppColors.primaryColor,
            textColor: AppColors.defaultTextColor);
}
