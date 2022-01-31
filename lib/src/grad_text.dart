import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  /// Text to show.
  final String text;

  /// List of colors to apply.
  final List<Color> colors;

  /// Text style.
  final TextStyle? style;

  /// How visual overflow should be handled.
  final TextOverflow? overflow;

  /// How the text should be aligned horizontally.
  final TextAlign textAlign;

  /// Defines what happens at the edge of the gradient.
  final TileMode tileMode;

  /// Use a custom gradient. This will override the [type],
  /// [colors], [transform] and [tileMode] parameters
  final Gradient? customGradient;

  /// Set gradient direction. Possible values:
  ///
  /// [GradientDirection.rtl] (Right to left)
  /// [GradientDirection.ltr] (Left to right)
  /// [GradientDirection.ttb] (Top to bottom)
  /// [GradientDirection.btt] (Bottom to top)
  final GradientDirection gradientDirection;

  /// Used for transforming gradient shaders without applying
  /// the same transform to the entire canvas.
  final GradientTransform? transform;

  /// Set gradient type. Possible values:
  ///
  /// [GradientType.linear]
  /// [GradientType.radial]
  final GradientType type;

  GradientText(
      {Key? key,
        required this.text,
        required this.colors,
        this.style,
        this.overflow,
        this.textAlign = TextAlign.start,
        this.tileMode = TileMode.clamp,
        this.customGradient,
        this.type = GradientType.linear,
        this.gradientDirection = GradientDirection.ltr,
        this.transform})
      : assert(colors.length > 1,
  'Colors cannot be null. You must specify a minimum of two colors'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return _createShader(bounds);
      },
      child: Text(
        text,
        style: style?.copyWith(color: Colors.white) ??
            TextStyle(color: Colors.white),
        overflow: overflow,
        textAlign: textAlign,
      ),
    );
  }

  Shader _createShader(Rect bounds) {
    if (customGradient != null) {
      return customGradient!.createShader(bounds);
    }

    switch (type) {
      case GradientType.linear:
        return _linearGradient(bounds).createShader(bounds);
      case GradientType.radial:
        return _radialGradient(bounds).createShader(bounds);
      default:
        return _linearGradient(bounds).createShader(bounds);
    }
  }

  Gradient _linearGradient(Rect bounds) {
    return LinearGradient(
      begin: _getGradientDirection('begin')!,
      end: _getGradientDirection('end')!,
      colors: colors,
      transform: transform,
      tileMode: tileMode,
    );
  }

  Gradient _radialGradient(Rect bounds) {
    return RadialGradient(
      colors: colors,
      transform: transform,
      tileMode: tileMode,
    );
  }

  Alignment? _getGradientDirection(String key) {
    final Map<String, Alignment> map = {
      'begin': Alignment.centerLeft,
      'end': Alignment.centerRight
    };

    switch (gradientDirection) {
      case GradientDirection.ltr:
        map['begin'] = Alignment.centerLeft;
        map['end'] = Alignment.centerRight;
        break;
      case GradientDirection.rtl:
        map['begin'] = Alignment.centerRight;
        map['end'] = Alignment.centerLeft;
        break;
      case GradientDirection.ttb:
        map['begin'] = Alignment.topCenter;
        map['end'] = Alignment.bottomCenter;
        break;
      case GradientDirection.btt:
        map['begin'] = Alignment.bottomCenter;
        map['end'] = Alignment.topCenter;
        break;
    }

    return map[key];
  }
}

enum GradientType { linear, radial }
enum GradientDirection { rtl, ltr, ttb, btt }