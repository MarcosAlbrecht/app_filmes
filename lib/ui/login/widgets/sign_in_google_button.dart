// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:cinebox/ui/core/themes/resource.dart';
import 'package:flutter/material.dart';

class SignInGoogleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;
  const SignInGoogleButton({
    super.key,
    required this.onPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.white, padding: EdgeInsets.zero),
      onPressed: onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Visibility(
              visible: !isLoading,
              replacement: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                    color: Colors.black,
                  ),
                ),
              ),
              child: Image.asset(R.ASSETS_IMAGES_GOOGLE_LOGO_PNG),
            ),
          ),
          Text(
            !isLoading ? 'Entrar com o Google' : 'Realizando login...',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.darkGrey,
            ),
          ),
        ],
      ),
    );
  }
}
