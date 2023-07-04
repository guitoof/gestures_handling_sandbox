import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum ShapeType { square, circle }

/// A copy of [ColoredBox] with a [HitTestBehavior] set to [HitTestBehavior.translucent]
/// to allow for the [child] to be clickable.
class TranslucentColoredBox extends SingleChildRenderObjectWidget {
  const TranslucentColoredBox(
      {required this.color,
      this.shape = ShapeType.square,
      Widget? child,
      Key? key})
      : super(key: key, child: child);

  final ShapeType shape;
  final Color color;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _TranslucentRenderColoredBox(color: color, shape: shape);
  }

  @override
  void updateRenderObject(BuildContext context, RenderObject renderObject) {
    (renderObject as _TranslucentRenderColoredBox).color = color;
    renderObject._shape = shape;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Color>('color', color));
  }
}

/// A copy of [_RenderColoredBox] with a [HitTestBehavior] set to [HitTestBehavior.translucent]
class _TranslucentRenderColoredBox extends RenderProxyBoxWithHitTestBehavior {
  _TranslucentRenderColoredBox({
    required Color color,
    ShapeType? shape,
  })  : _color = color,
        _shape = shape ?? ShapeType.square,
        super(behavior: HitTestBehavior.translucent);

  Color get color => _color;
  Color _color;
  set color(Color value) {
    if (value == _color) {
      return;
    }
    _color = value;
    markNeedsPaint();
  }

  ShapeType _shape;
  ShapeType get shape => _shape;
  set shape(ShapeType value) {
    if (value == _shape) {
      return;
    }
    _shape = value;
    markNeedsPaint();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (size > Size.zero) {
      switch (_shape) {
        case ShapeType.square:
          context.canvas.drawRect(offset & size, Paint()..color = color);
          break;
        case ShapeType.circle:
          context.canvas.drawCircle(
            offset + Offset(size.shortestSide / 2, size.shortestSide / 2),
            size.shortestSide / 2,
            Paint()..color = color,
          );
      }
    }
    if (child != null) {
      context.paintChild(child!, offset);
    }
  }
}
