import 'package:flutter/material.dart';
import 'package:flutter_tests/ui/others/animation_utils.dart';

class ExpandingSectionWidget extends StatefulWidget {

  final Widget child;
  final bool expand;
  final AnimationUtils animationUtils;

  ExpandingSectionWidget({
    this.expand = false,
    this.child,
    final AnimationUtils animationUtils
  }): animationUtils = animationUtils ?? AnimationUtils.sharedInstance;

  @override
  _ExpandedSectionState createState() => _ExpandedSectionState();
}

class _ExpandedSectionState extends State<ExpandingSectionWidget> with SingleTickerProviderStateMixin {
  AnimationController expandController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
  }

  ///Setting up the animation
  void prepareAnimations() {
    expandController = AnimationController(
        vsync: this,
        duration: widget.animationUtils.expandCollapseDuration,
    );
    Animation curve = CurvedAnimation(
      parent: expandController,
      curve: Curves.linear,
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(curve);

    _animate();
  }

  @override
  void didUpdateWidget(ExpandingSectionWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _animate();
  }

  void _animate() {
    if(widget.expand) { expandController.forward(); }
    else { expandController.reverse(); }
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        axisAlignment: 1.0,
        sizeFactor: animation,
        child: widget.child
    );
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }
}