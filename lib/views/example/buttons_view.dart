import 'package:flutter/material.dart';

class ButtonsExample extends StatelessWidget {
  const ButtonsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buttons Example"),
      ),
      body: const SimpleButtons(),
    );
  }
}

class SimpleButtons extends StatelessWidget {
  const SimpleButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Simple with colors properly styled"),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SimpleElevatedButton(
                  color: Colors.blue,
                  onPressed: () {},
                  child: const Text("Elevated Button"),
                ),
                SimpleOutlinedButton(
                  onPressed: () {},
                  outlineColor: Colors.blue,
                  child: const Text("Outlined Button"),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SimpleElevatedButton(
                  color: Colors.green,
                  onPressed: () {},
                  child: const Text("Elevated Button"),
                ),
                SimpleOutlinedButton(
                  onPressed: () {},
                  outlineColor: Colors.green,
                  child: const Text("Outlined Button"),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SimpleElevatedButton(
                  color: Colors.amber,
                  onPressed: () {},
                  child: const Text("Elevated Button"),
                ),
                SimpleOutlinedButton(
                  onPressed: () {},
                  outlineColor: Colors.amber,
                  child: const Text("Outlined Button"),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text("Simple with icons & colors"),
            const SizedBox(height: 6),
            Column(
              children: [
                SimpleElevatedButtonWithIcon(
                  label: const Text("Done"),
                  iconData: Icons.check,
                  color: Colors.green,
                  onPressed: () {},
                ),
                const SizedBox(height: 12),
                SimpleElevatedButtonWithIcon(
                  label: const Text("Warning!"),
                  iconData: Icons.warning_amber_outlined,
                  color: Colors.amber,
                  onPressed: () {},
                ),
                const SizedBox(height: 12),
                SimpleElevatedButtonWithIcon(
                  label: const Text("ERROR"),
                  iconData: Icons.error_outline,
                  color: Colors.red,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text("Simple circular with icons"),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SimpleCircularIconButton(
                  iconData: Icons.remove,
                  fillColor: Colors.red,
                  iconColor: Colors.white,
                  radius: 32,
                  onPressed: () {},
                ),
                SimpleCircularIconButton(
                  iconData: Icons.add,
                  fillColor: Colors.green,
                  iconColor: Colors.white,
                  radius: 48,
                  onPressed: () {},
                ),
                SimpleCircularIconButton(
                  iconData: Icons.edit,
                  onPressed: () {},
                ),
                SimpleCircularIconButton(
                  iconData: Icons.check,
                  iconColor: Colors.green,
                  outlineColor: Colors.green,
                  onPressed: () {},
                )
              ],
            ),
            const SizedBox(height: 32),
            const Text("And with alerts"),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SimpleCircularIconButton(
                  iconData: Icons.warning_amber_outlined,
                  fillColor: Colors.amber,
                  iconColor: Colors.white,
                  onPressed: () {},
                  radius: 32,
                  notificationCount: 2,
                ),
                SimpleCircularIconButton(
                  iconData: Icons.new_releases_outlined,
                  fillColor: Colors.blue,
                  iconColor: Colors.white,
                  onPressed: () {},
                  notificationCount: 4,
                ),
                SimpleCircularIconButton(
                  iconData: Icons.messenger_outline_sharp,
                  fillColor: Colors.green,
                  iconColor: Colors.white,
                  onPressed: () {},
                  radius: 64,
                  notificationCount: 6,
                ),
                SimpleCircularIconButton(
                  iconData: Icons.notifications,
                  fillColor: Colors.amber,
                  iconColor: Colors.white,
                  onPressed: () {},
                  radius: 80,
                  notificationCount: 8,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SimpleElevatedButton extends StatelessWidget {
  const SimpleElevatedButton(
      {this.child,
      this.color,
      this.onPressed,
      this.borderRadius = 6,
      this.padding = const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
      super.key});
  final Color? color;
  final Widget? child;
  final Function? onPressed;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    // ThemeData currentTheme = Theme.of(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: padding,
        // primary: color ?? currentTheme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onPressed as void Function()?,
      child: child,
    );
  }
}

class SimpleOutlinedButton extends StatelessWidget {
  const SimpleOutlinedButton(
      {this.child,
      this.textColor,
      this.outlineColor,
      required this.onPressed,
      this.borderRadius = 6,
      this.padding = const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
      super.key});
  final Widget? child;
  final Function onPressed;
  final double borderRadius;
  final Color? outlineColor;
  final Color? textColor;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: padding,
        textStyle: TextStyle(color: currentTheme.primaryColor),
        side: BorderSide(color: outlineColor ?? currentTheme.primaryColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        // primary: textColor ?? outlineColor ?? currentTheme.primaryColor,
      ),
      onPressed: onPressed as void Function()?,
      child: child!,
    );
  }
}

class SimpleElevatedButtonWithIcon extends StatelessWidget {
  const SimpleElevatedButtonWithIcon(
      {required this.label,
      this.color,
      this.iconData,
      required this.onPressed,
      this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      super.key});
  final Widget label;
  final Color? color;
  final IconData? iconData;
  final Function onPressed;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed as void Function()?,
      icon: Icon(iconData),
      label: label,
      // style: ElevatedButton.styleFrom(primary: color, padding: padding),
    );
  }
}

class SimpleCircularIconButton extends StatelessWidget {
  const SimpleCircularIconButton(
      {this.fillColor = Colors.transparent,
      required this.iconData,
      this.iconColor = Colors.blue,
      this.outlineColor = Colors.transparent,
      this.notificationFillColor = Colors.red,
      this.notificationCount,
      this.onPressed,
      this.radius = 48.0,
      super.key});

  final IconData iconData;
  final Color fillColor;
  final Color outlineColor;
  final Color iconColor;
  final Color notificationFillColor;
  final int? notificationCount;
  final Function? onPressed;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Ink(
          width: radius,
          height: radius,
          decoration: ShapeDecoration(
            color: fillColor,
            shape: CircleBorder(side: BorderSide(color: outlineColor)),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            splashRadius: radius / 2,
            iconSize: radius / 2,
            icon: Icon(iconData, color: iconColor),
            splashColor: iconColor.withOpacity(.4),
            onPressed: onPressed as void Function()?,
          ),
        ),
        if (notificationCount != null) ...[
          Positioned(
            top: radius / -14,
            right: radius / -14,
            child: Container(
              width: radius / 2.2,
              height: radius / 2.2,
              decoration: ShapeDecoration(
                color: notificationFillColor,
                shape: const CircleBorder(),
              ),
              child: Center(
                child: Text(
                  notificationCount.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: radius / 4,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
