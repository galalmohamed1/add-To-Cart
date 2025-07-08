import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    this.text,
    required this.ontap,
    this.style = const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),
    this.borderRadius = 8,
    this.bgColor,
    this.borderColor,
    this.showBorder = false,
    this.isLoading = false,
    this.enable = true,
    this.padding,
    this.margin = EdgeInsets.zero,
    this.height,
    this.width,
    this.child,
    this.icon,
    // this.dontGiveMinWidth,
  });
  final String? text;
  final Function() ontap;
  final TextStyle style;
  final double borderRadius;
  final Color? bgColor;
  final Color? borderColor;
  final bool showBorder;
  final bool isLoading;
  final bool enable;
  final EdgeInsets? padding;
  final EdgeInsets margin;
  final double? height;
  final double? width;
  final Widget? child;
  final dynamic icon;
  // final bool? dontGiveMinWidth;

  @override
  Widget build(BuildContext context) {
    final calcHeight = height ?? (padding?.vertical ?? 16) * 2 + (style.fontSize ?? 15);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 40.0),
      child:
          isLoading
              ? SizedBox(
                height: calcHeight,
                child: Center(
                  child:
                      Platform.isAndroid
                          ? CircularProgressIndicator(color: bgColor)
                          : CupertinoActivityIndicator(color: bgColor, radius: calcHeight * 0.4),
                ),
              )
              : Padding(
                padding: margin,
                child: MaterialButton(
                  onPressed: enable ? ontap : null,
                  minWidth: padding != null ? null : width ?? 40,
                  height: 0,
                  disabledColor: Color(0xffFE962D).withAlpha(10),
                  padding: padding ?? const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  color: !enable ? Colors.black12 : bgColor,
                  shape: RoundedRectangleBorder(
                    side: showBorder ? BorderSide(color: borderColor ?? style.color ??Color(0xffFE962D)) : BorderSide.none,
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  child:
                      child ??
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (icon != null && icon is IconData) Icon(icon, color: style.color ?? Colors.white, size: 22),
                          if (icon != null && icon is String)
                            SvgPicture.asset(
                              icon,
                              width: 28,
                              height: 28,
                              colorFilter: ColorFilter.mode(style.color ?? Colors.white, BlendMode.srcIn),
                            ),
                          const Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 12)),
                          Text(text!, style: style, overflow: TextOverflow.ellipsis),
                          const Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 12)),
                        ],
                      ),
                ),
              ),
    );
  }
}
