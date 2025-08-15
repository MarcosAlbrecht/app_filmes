import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin LoaderAndMessage<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  var isOpen = false;
  void showLoader() {
    if (!isOpen) {
      isOpen = true;
      showDialog(
        context: context,
        builder: (_) {
          return LoadingAnimationWidget.threeArchedCircle(
            color: Colors.white,
            size: 60,
          );
        },
        barrierDismissible: true,
      );
    }
  }

  void hideLoader() {
    if (isOpen) {
      isOpen = false;
      Navigator.of(context).pop();
    }
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: color,
        behavior: SnackBarBehavior.fixed, // permite flutuar
        elevation: 4, // sombra (efeito moderno)
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // bordas arredondadas
        ),
        duration: const Duration(milliseconds: 3000),
        animation: CurvedAnimation(
          parent: kAlwaysCompleteAnimation,
          curve: Curves.bounceIn, // suaviza a entrada/saída
        ),
      ),
    );
  }

  void showErrorSnackBar(String message) =>
      _showSnackBar(message, AppColors.redColor);

  void showSuccessSnackBar(String message) =>
      _showSnackBar(message, Colors.green);

  void showInfoSnackBar(String message) =>
      _showSnackBar(message, Colors.lightBlue);
}
