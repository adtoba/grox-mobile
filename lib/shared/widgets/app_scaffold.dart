import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/extensions/image_path_extension.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({
    super.key,
    this.appBar,
    this.backgroundImage,
    this.body,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.drawer,
    this.endDrawer,
    this.bottomSheet,
    this.backgroundColor,
    this.extendBody,
    this.extendBodyBehindAppBar,  
  });

  final Widget? appBar;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? bottomSheet;
  final Widget? backgroundColor;
  final bool? extendBody;
  final String? backgroundImage;
  final bool? extendBodyBehindAppBar;
  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar as PreferredSizeWidget?,
      body: Stack(
        children: [
          Container(),
          if (widget.backgroundImage != null)...[
            Positioned(
              bottom: 10.h,
              left: 0,
              right: 0,
              child: Image.asset(
                widget.backgroundImage!.toPng,
                fit: BoxFit.cover,
              ),
            )
          ],
          widget.body!,
        ],
      ),
      bottomNavigationBar: widget.bottomNavigationBar,
      floatingActionButton: widget.floatingActionButton,
      drawer: widget.drawer,
      endDrawer: widget.endDrawer,
      bottomSheet: widget.bottomSheet,
      backgroundColor: widget.backgroundColor as Color?,
      extendBody: widget.extendBody ?? false,
      extendBodyBehindAppBar: widget.extendBodyBehindAppBar ?? false,
    );
  }
}