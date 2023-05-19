import 'package:flutter/material.dart';

class DotsLoadingIndicator extends StatefulWidget {
  final double size;
  final Color color;
  final double? value;

  const DotsLoadingIndicator({
    Key? key,
    this.color = Colors.white,
    this.size = 36.0,
    this.value,
  }) : super(key: key);

  @override
  State<DotsLoadingIndicator> createState() => _DotsLoadingIndicatorState();
}

class _DotsLoadingIndicatorState extends State<DotsLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 800,
      ),
    );

    final value = widget.value;
    if (value == null) {
      _animationController.repeat();
    } else {
      _animationController.value = value.clamp(0.01, 0.99);
    }
  }

  @override
  void didUpdateWidget(DotsLoadingIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value == null && !_animationController.isAnimating) {
      _animationController.repeat();
    } else if (widget.value != null && _animationController.isAnimating) {
      _animationController.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color color = widget.color;
    final double size = widget.size;
    final double dotSize = size * 0.2;
    final double negativeSpace = size - (3 * dotSize);
    final double gapBetweenDots = negativeSpace / 2;
    final double previousDotPosition = (gapBetweenDots + dotSize);

    Widget translatingDot() => Transform.translate(
          offset: Tween<Offset>(
            begin: Offset.zero,
            end: Offset(previousDotPosition, 0),
          )
              .animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: const Interval(
                    0.22,
                    0.82,
                  ),
                ),
              )
              .value,
          child: _DrawDot.circular(
            dotSize: dotSize,
            color: color,
          ),
        );

    Widget scalingDot(bool scaleDown, Interval interval) => Transform.scale(
          scale: Tween<double>(
            begin: scaleDown ? 1.0 : 0.0,
            end: scaleDown ? 0.0 : 1.0,
          )
              .animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: interval,
                ),
              )
              .value,
          child: _DrawDot.circular(
            dotSize: dotSize,
            color: color,
          ),
        );

    return SizedBox(
      width: size,
      height: size,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(
              children: <Widget>[
                scalingDot(
                  false,
                  const Interval(
                    0.3,
                    0.7,
                  ),
                ),
                translatingDot(),
              ],
            ),
            translatingDot(),
            scalingDot(
              true,
              const Interval(
                0.0,
                0.4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class _DrawDot extends StatelessWidget {
  final double width;
  final double height;
  final bool circular;
  final Color color;

  const _DrawDot.circular({
    Key? key,
    required double dotSize,
    required this.color,
  })  : width = dotSize,
        height = dotSize,
        circular = true,
        super(key: key);

  const _DrawDot.elliptical({
    Key? key,
    required this.width,
    required this.height,
    required this.color,
  })  : circular = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        shape: circular ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: circular
            ? null
            : BorderRadius.all(Radius.elliptical(width, height)),
      ),
    );
  }
}
