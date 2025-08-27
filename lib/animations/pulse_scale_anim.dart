import 'package:flutter/material.dart';

class PulseScale extends StatefulWidget {
  final Widget child;
  final double min, max;
  final Duration duration;
  const PulseScale({
    super.key,
    required this.child,
    this.min = 0.96,
    this.max = 1.04,
    this.duration = const Duration(milliseconds: 900),
  });

  @override
  State<PulseScale> createState() => _PulseScaleState();
}

class _PulseScaleState extends State<PulseScale>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ac =
      AnimationController(vsync: this, duration: widget.duration)
        ..repeat(reverse: true);
  late final Animation<double> _scale =
      Tween(begin: widget.min, end: widget.max)
          .animate(CurvedAnimation(parent: _ac, curve: Curves.easeInOut));

  @override
  void dispose() {
    _ac.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
        scale: _scale, child: widget.child); // child not rebuilt
  }
}
