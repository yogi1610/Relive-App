import 'package:flutter/material.dart';
import 'package:relive_app/utils/app_files_imports.dart';

class AppImage extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? errorWidget;
  final Widget? placeholder;

  const AppImage({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.errorWidget,
    this.placeholder,
  });

  bool _isSvg(String path) => path.toLowerCase().endsWith('.svg');

  bool _isNetworkUrl(String path) =>
      path.startsWith('http://') || path.startsWith('https://');

  bool _isBase64(String path) {
    // very basic check for base64 image data
    return path.startsWith('data:image') || _isLikelyBase64(path);
  }

  bool _isLikelyBase64(String path) {
    // check for pure base64 without header
    return path.length % 4 == 0 &&
        RegExp(r'^[A-Za-z0-9+/=]+$').hasMatch(path) &&
        path.length > 100;
  }

  bool _isFilePath(String path) =>
      !path.startsWith('http') &&
      !path.startsWith('assets/') &&
      path.isNotEmpty &&
      File(path).existsSync();

  bool _isAsset(String path) =>
      path.isNotEmpty && (!path.contains('/') || path.startsWith('assets/'));

  Uint8List? _getBytesFromBase64(String base64Str) {
    try {
      final cleaned = base64Str.contains(',')
          ? base64Str.split(',').last
          : base64Str;
      return base64Decode(cleaned);
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    try {
      if (_isBase64(imagePath)) {
        final bytes = _getBytesFromBase64(imagePath);
        if (bytes != null) {
          return Image.memory(
            bytes,
            width: width?.w,
            height: height?.h,
            fit: fit,
            errorBuilder: (_, __, ___) =>
                errorWidget ?? const Icon(Icons.broken_image),
          );
        }
      }

      if (_isSvg(imagePath)) {
        if (_isNetworkUrl(imagePath)) {
          return SvgPicture.network(
            imagePath,
            width: width?.w,
            height: height?.h,
            fit: fit,
            placeholderBuilder: (_) =>
                placeholder ?? const Center(child: CircularProgressIndicator()),
          );
        } else {
          return SvgPicture.asset(
            imagePath,
            width: width?.w,
            height: height?.h,
            fit: fit,
          );
        }
      } else if (_isNetworkUrl(imagePath)) {
        return AppNetworkImage(
          image: imagePath,
          width: width?.w,
          height: height?.h,
          fit: fit,
          errorWidget: errorWidget ?? const Icon(Icons.broken_image),
        );
      } else if (_isFilePath(imagePath)) {
        return Image.file(
          File(imagePath),
          width: width?.w,
          height: height?.h,
          fit: fit,
          filterQuality: FilterQuality.high,
          errorBuilder: (_, __, ___) =>
              errorWidget ?? const Icon(Icons.broken_image),
        );
      } else if (_isAsset(imagePath)) {
        return Image.asset(
          imagePath,
          width: width?.w,
          height: height?.h,
          fit: fit,
          errorBuilder: (_, __, ___) =>
              errorWidget ?? const Icon(Icons.broken_image),
        );
      } else {
        return errorWidget ?? const Icon(Icons.error_outline);
      }
    } catch (_) {
      return errorWidget ?? const Icon(Icons.error_outline);
    }
  }
}
