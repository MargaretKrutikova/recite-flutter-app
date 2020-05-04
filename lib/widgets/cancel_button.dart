import 'package:recite_flutter/theme.dart';

import 'base_button.dart';

class CancelButton extends BaseButton {
  CancelButton({onPressed, text})
      : super(
            onPressed: onPressed,
            text: text,
            textColor: AppColors.darkBackgroundColor,
            backgroundColor: AppColors.cancelColor);
}
