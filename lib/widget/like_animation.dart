// import 'package:flutter/material.dart';

// class LikeAnimation extends StatefulWidget {
//   const LikeAnimation(
//       {super.key,
//       required this.child,
//       required this.isAnimating,
//       required this.duration,
//       this.onEnd});
//   final Widget child;
//   final bool isAnimating;
//   final Duration duration = const Duration(milliseconds: 150);
//   final bool smallLike = false;
//   final VoidCallback? onEnd;

//   @override
//   State<LikeAnimation> createState() => _LikeAnimationState();
// }

// class _LikeAnimationState extends State<LikeAnimation>
//     with SingleTickerProviderStateMixin {
//   late AnimationController controller;

//   @override
//   void initState() {
//     controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: widget.duration.inMilliseconds ~/ 2),
//     );
//     scale = Tween<double>(begin: 1, end: 1.2).animate(controller);
//     super.initState();
//   }

//   @override
//   void didUpdateWidget(covariant LikeAnimation oldWidget) {
//     super.didUpdateWidget(oldWidget);

//     if (widget.isAnimating != oldWidget.isAnimating) {
//       await co
//     } else {}
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
