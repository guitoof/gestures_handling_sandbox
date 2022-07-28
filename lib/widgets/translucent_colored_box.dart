import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// A copy of [ColoredBox] with a [HitTestBehavior] set to [HitTestBehavior.translucent]
/// to allow for the [child] to be clickable.
class TranslucentColoredBox extends SingleChildRenderObjectWidget {
  const TranslucentColoredBox({required this.color, Widget? child, Key? key})
      : super(key: key, child: child);

  final Color color;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _TranslucentRenderColoredBox(color: color);
  }

  @override
  void updateRenderObject(BuildContext context, RenderObject renderObject) {
    (renderObject as _TranslucentRenderColoredBox).color = color;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Color>('color', color));
  }
}

/// A copy of [_RenderColoredBox] with a [HitTestBehavior] set to [HitTestBehavior.translucent]
class _TranslucentRenderColoredBox extends RenderProxyBoxWithHitTestBehavior {
  _TranslucentRenderColoredBox({required Color color})
      : _color = color,
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

  @override
  void paint(PaintingContext context, Offset offset) {
    if (size > Size.zero) {
      context.canvas.drawRect(offset & size, Paint()..color = color);
    }
    if (child != null) {
      context.paintChild(child!, offset);
    }
  }
}
