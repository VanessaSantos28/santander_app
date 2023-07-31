import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:santander_app/models/user_model/card.dart';
import 'package:santander_app/shared/app_colors.dart';
import 'package:santander_app/shared/app_images';
import 'package:santander_app/shared/app_settings.dart';

class CardWidget extends StatelessWidget {
  final CreditCard card;
  const CardWidget({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      width: AppSettings.screenWidth - 24,
      decoration: BoxDecoration(
        color: AppColors.red,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Cartão final: ${card.number!.split(' ')[3]}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SvgPicture.asset(
            AppImages.down,
            semanticsLabel: "",
            height: 14,
          ),
        ],
      ),
    );
  }
}
