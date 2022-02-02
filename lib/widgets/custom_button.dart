import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final double? radius;
  final void Function()? onTap;
  const CustomButton({
    Key? key,
    this.child,
    this.width,
    this.height,
    this.radius,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 10),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(82, 92, 207, 1),
              Color.fromRGBO(56, 62, 136, 1),
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}
