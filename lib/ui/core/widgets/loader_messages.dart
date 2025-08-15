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
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;

    // Controlador de animação
    final animationController = AnimationController(
      vsync: overlay,
      duration: const Duration(milliseconds: 300),
    );

    final animation =
        Tween<Offset>(
          begin: const Offset(0, -1),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Curves.easeOut,
          ),
        );

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 50,
        left: 0,
        right: 0,
        child: Material(
          color: Colors.transparent,
          child: SlideTransition(
            position: animation,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 24,
              ),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                message,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);
    animationController.forward();

    // Duração do snack e remoção
    Future.delayed(const Duration(seconds: 3), () async {
      await animationController.reverse();
      overlayEntry.remove();
      animationController.dispose();
    });
  }

  void showErrorSnackBar(String message) =>
      _showSnackBar(message, AppColors.redColor);

  void showSuccessSnackBar(String message) =>
      _showSnackBar(message, Colors.green);

  void showInfoSnackBar(String message) =>
      _showSnackBar(message, Colors.lightBlue);
}
