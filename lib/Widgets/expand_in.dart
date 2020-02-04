import 'dart:wasm';

import 'package:flutter/material.dart';

class ExpandIn extends StatefulWidget {
  final Widget child;
  final Duration duration;



  ExpandIn({
    this.child,
    this.duration
  }) : assert(child != null);

  @override
  createState() => _ExpandIn();
}

class _ExpandIn extends State<ExpandIn> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return ScaleTransition(
      scale: _animation,
      child: widget.child,
    );
  }
}
