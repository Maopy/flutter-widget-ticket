library fw_ticket;

import 'package:flutter/widgets.dart';
import 'package:clip_shadow/clip_shadow.dart';

class Ticket extends StatelessWidget {
  const Ticket({
    Key key,
    this.innerRadius = const BorderRadius.all(Radius.circular(0.0)),
    this.outerRadius = const BorderRadius.all(Radius.circular(0.0)),
    this.child,
    this.boxShadow = const [],
    this.dashedBottom = false
  }) : super(key: key);

  final BorderRadius innerRadius;

  final BorderRadius outerRadius;

  final List<BoxShadow> boxShadow;

  // TODO: custom border styles
  final bool dashedBottom;

  /// The [child] contained by the ticket widget.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipShadow(
      clipper: _TicketClipper(innerRadius, outerRadius),
      boxShadow: boxShadow,
      child: child,
    );
  }
}

class _TicketClipper extends CustomClipper<Path> {
  _TicketClipper(this.innerRadius, this.outerRadius);
//  const defaultRadius = BorderRadius.all(Radius.circular(0.0));

  final BorderRadius innerRadius;

  final BorderRadius outerRadius;

  @override
  Path getClip(Size size) {
    /// approximation to a circular arc
    const C = 0.551915024494;
    final path = Path();

    var currentUseInner = false;
    var currentRadius = Radius.circular(0.0);

    currentUseInner = innerRadius.topLeft != Radius.circular(0.0);
    currentRadius = currentUseInner ? innerRadius.topLeft : outerRadius.topLeft;
    path.moveTo(0.0, currentRadius.y);
    path.cubicTo(
      currentUseInner ? currentRadius.x * C : 0.0,
      currentUseInner ? currentRadius.y : currentRadius.y * (1 - C),
      currentUseInner ? currentRadius.x : currentRadius.x * (1 - C),
      currentUseInner ? currentRadius.y * C : 0.0,
      currentRadius.x, 0.0);

    currentUseInner = innerRadius.topRight != Radius.circular(0.0);
    currentRadius = currentUseInner ? innerRadius.topRight : outerRadius.topRight;
    path.lineTo(size.width - currentRadius.x, 0.0);
    path.cubicTo(
      currentUseInner ? size.width - currentRadius.x : size.width - currentRadius.x * (1 - C),
      currentUseInner ? currentRadius.y * C : 0.0,
      currentUseInner ? size.width - currentRadius.x * C : size.width,
      currentUseInner ? currentRadius.y : currentRadius.y * (1 - C),
      size.width, currentRadius.y);

    currentUseInner = innerRadius.bottomRight != Radius.circular(0.0);
    currentRadius = currentUseInner ? innerRadius.bottomRight : outerRadius.bottomRight;
    path.lineTo(size.width, size.height - currentRadius.y);
    path.cubicTo(
      currentUseInner ? size.width - currentRadius.x * C : size.width,
      currentUseInner ? size.height - currentRadius.y : size.height - currentRadius.y * (1 - C),
      currentUseInner ? size.width - currentRadius.x : size.width - currentRadius.x * (1 - C),
      currentUseInner ? size.height - currentRadius.y * C : size.height,
      size.width - currentRadius.x, size.height);

    currentUseInner = innerRadius.bottomLeft != Radius.circular(0.0);
    currentRadius = currentUseInner ? innerRadius.bottomLeft : outerRadius.bottomLeft;
    path.lineTo(currentRadius.x, size.height);
    path.cubicTo(
      currentUseInner ? currentRadius.x : currentRadius.x * (1 - C),
      currentUseInner ? size.height - currentRadius.y * C : size.height,
      currentUseInner ? currentRadius.x * C : 0.0,
      currentUseInner ? size.height - currentRadius.y : size.height - currentRadius.y * (1 - C),
      0.0, size.height - currentRadius.y);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
