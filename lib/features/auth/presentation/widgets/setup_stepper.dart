import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/theme/app_colors.dart';

enum SetupStepStatus { completed, active, upcoming }

class SetupStep {
  const SetupStep({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;
}

class SetupStepper extends StatelessWidget {
  const SetupStepper({
    super.key,
    required this.steps,
    required this.currentStep,
  });

  final List<SetupStep> steps;

  /// 0-based index of the active step. All previous steps are completed.
  final int currentStep;

  SetupStepStatus _statusFor(int index) {
    if (index < currentStep) return SetupStepStatus.completed;
    if (index == currentStep) return SetupStepStatus.active;
    return SetupStepStatus.upcoming;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < steps.length; i++)
          _SetupStepTile(
            index: i,
            step: steps[i],
            status: _statusFor(i),
            isLast: i == steps.length - 1,
            lineColor: i < currentStep ? AppColors.poppy : AppColors.grey3,
          ),
      ],
    );
  }
}

class _SetupStepTile extends StatelessWidget {
  const _SetupStepTile({
    required this.index,
    required this.step,
    required this.status,
    required this.isLast,
    required this.lineColor,
  });

  final int index;
  final SetupStep step;
  final SetupStepStatus status;
  final bool isLast;
  final Color lineColor;

  bool get _isMuted => status == SetupStepStatus.completed;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 28.w,
            child: Column(
              children: [
                SetupStepIndicator(
                  index: index,
                  status: status,
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 1.5.w,
                      margin: EdgeInsets.symmetric(vertical: 4.h),
                      color: lineColor,
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 28.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    step.title,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: _isMuted ? AppColors.grey7 : AppColors.grey10,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    step.description,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                      color: _isMuted ? AppColors.grey7 : AppColors.grey9,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SetupStepIndicator extends StatelessWidget {
  const SetupStepIndicator({
    super.key,
    required this.index,
    required this.status,
  });

  final int index;
  final SetupStepStatus status;

  @override
  Widget build(BuildContext context) {
    final isCompleted = status == SetupStepStatus.completed;
    final isActive = status == SetupStepStatus.active;
    final color = isCompleted || isActive ? AppColors.poppy : AppColors.grey3;

    return SizedBox(
      width: 28.w,
      height: 28.w,
      child: CustomPaint(
        painter: _FlowerStepPainter(
          filled: isCompleted,
          color: color,
        ),
        child: Center(
          child: isCompleted
              ? Icon(
                  Icons.check_rounded,
                  size: 14.sp,
                  color: AppColors.white,
                )
              : Text(
                  '${index + 1}',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: color,
                    height: 1,
                  ),
                ),
        ),
      ),
    );
  }
}

class _FlowerStepPainter extends CustomPainter {
  const _FlowerStepPainter({
    required this.filled,
    required this.color,
  });

  final bool filled;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final path = _flowerPath(size);
    final paint = Paint()
      ..isAntiAlias = true
      ..color = color
      ..style = filled ? PaintingStyle.fill : PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(path, paint);
  }

  Path _flowerPath(Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final lobeRadius = size.width * 0.30;
    final offset = size.width * 0.175;

    final lobes = <Offset>[
      Offset(center.dx, center.dy - offset),
      Offset(center.dx + offset, center.dy),
      Offset(center.dx, center.dy + offset),
      Offset(center.dx - offset, center.dy),
    ];

    var path = Path()
      ..addOval(Rect.fromCircle(center: lobes.first, radius: lobeRadius));

    for (int i = 1; i < lobes.length; i++) {
      final lobe = Path()
        ..addOval(Rect.fromCircle(center: lobes[i], radius: lobeRadius));
      path = Path.combine(PathOperation.union, path, lobe);
    }

    return path;
  }

  @override
  bool shouldRepaint(covariant _FlowerStepPainter oldDelegate) {
    return oldDelegate.filled != filled || oldDelegate.color != color;
  }
}
