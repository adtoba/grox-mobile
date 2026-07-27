import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/shared/widgets/appbar_back_button.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PrimaryAppBar({
    super.key,
    this.title,
    this.showBackButton = true,
    this.leading,
    this.actions,
  });

  final String? title;
  final bool showBackButton;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final showLeading = showBackButton || leading != null;

    return AppBar(
      title: title != null ? Text(title!) : null,
      centerTitle: false,
      automaticallyImplyLeading: false,
      leading: leading ?? (showBackButton ? const AppbarBackButton() : null),
      leadingWidth: showLeading ? AppbarBackButton.size + 16.w : 0,
      actions: actions,
    );
  }
}
