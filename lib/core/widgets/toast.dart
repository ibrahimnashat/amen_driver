import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

import '../consts/exports.dart';

class Toast {
  static void show({
    required BuildContext context,
    required String? message,
    required IconData icon,
    Color? color,
  }) {
    MotionToast(
      icon: icon,
      primaryColor: Colors.white,
      secondaryColor: color ?? Coolors.primaryColor,
      backgroundType: BackgroundType.solid,
      barrierColor: Colors.black12,
      title: Text(
        'Note !',
        style: TextStyle(
          color: color ?? Coolors.primaryColor,
          fontSize: 24,
          fontFamily: FoontFamily.tajawalBold,
        ),
      ),
      description: Text(
        message ?? '',
        style: TextStyle(
          color: color ?? Coolors.primaryColor,
          fontSize: 18,
          fontFamily: FoontFamily.tajawalRegular,
        ),
      ),
      width: context.mWidth * 0.95,
      height: context.mHeight * 0.12,
      enableAnimation: true,
    ).show(context);
  }

  static void showOnError(
    BuildContext context,
    String? error,
  ) {
    if (error != "") {
      show(
        context: context,
        message: error,
        icon: Icons.error,
        color: Coolors.red,
      );
    }
  }

  static void showOnSuccessfully(
    BuildContext context,
    String message,
  ) {
    if (message != "") {
      show(
        context: context,
        message: message,
        icon: Icons.check,
      );
    }
  }
}
