import 'package:flutter/material.dart';
import 'package:relive_app/utils/app_files_imports.dart';

class AppNetworkImage extends StatelessWidget {
  final String? image;
  final double? height;
  final double? width;
  final Widget? errorWidget;
  final BoxFit? fit;
  final bool? showLoader;

  const AppNetworkImage({
    super.key,
    this.image,
    this.height,
    this.width,
    this.showLoader,
    this.errorWidget,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit ?? BoxFit.cover,
      height: height,
      width: width,
      placeholder: (context, url) => Visibility(
          visible: showLoader ?? false,
          child: Center(child: Image.asset('assets/images/svg/gif_loader.gif'))),
      errorWidget: (context, url, error) =>
      errorWidget ??
          const Icon(
            Icons.error,
            color: Colors.red,
          ),
      imageUrl: image ?? '',
    );
  }
}