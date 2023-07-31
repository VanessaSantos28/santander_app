import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:santander_app/pages/pix/pix.dart';
import 'package:santander_app/shared/app_colors.dart';
import 'package:santander_app/shared/app_settings.dart';

import '../models/user_model/feature.dart';

class FeaturesWidget extends StatefulWidget {
  final List<Feature> features;
  const FeaturesWidget({super.key, required this.features});

  @override
  State<FeaturesWidget> createState() => _FeaturesWidgetState();
}

class _FeaturesWidgetState extends State<FeaturesWidget> {
  Widget getFeature(String icon, String description) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PixPage(),
          ),
        );
      },
      child: Card(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          width: 140,
          height: 125,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.network(
                icon,
                colorFilter: ColorFilter.mode(
                  AppColors.red,
                  BlendMode.srcIn,
                ),
                width: 36,
                height: 36,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                description,
                style: TextStyle(fontSize: 16, color: AppColors.grayLight),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 130,
      width: AppSettings.screenWidth,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: widget.features
            .map((e) => getFeature(e.icon!, e.description!))
            .toList(),
      ),
    );
  }
}
