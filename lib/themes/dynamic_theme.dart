import 'package:flutter/material.dart';

typedef ThemedWidgetBuilder = Widget Function(
    BuildContext context, ThemeData theme);

typedef ThemeDataWithBrightnessBuilder = ThemeData Function(
    Brightness brightness);

class DynamicTheme extends StatefulWidget {
  const DynamicTheme(
      {Key key, this.theme, this.builder, this.defaultBrightness})
      : super(key: key);

  final ThemedWidgetBuilder builder;
  final ThemeDataWithBrightnessBuilder theme;
  final Brightness defaultBrightness;

  @override
  _DynamicThemeState createState() => _DynamicThemeState();

  static _DynamicThemeState of(BuildContext context) {
    return context.ancestorStateOfType(const TypeMatcher<_DynamicThemeState>());
  }
}

class _DynamicThemeState extends State<DynamicTheme> {
  ThemeData _theme;
  Brightness _brightness;

  ThemeData get theme => _theme;
  Brightness get brightness => _brightness;

  @override
  void initState() {
    super.initState();
    _brightness = widget.defaultBrightness;
    _theme = widget.theme(_brightness);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _theme = widget.theme(_brightness);
  }

  @override
  void didUpdateWidget(DynamicTheme oldWidget) {
    super.didUpdateWidget(oldWidget);
    _theme = widget.theme(_brightness);
  }

  Brightness getBrightness() {
    return _brightness;
  }

  void setBrightness(Brightness brightness) {
    setState(() {
      _theme = widget.theme(brightness);
      _brightness = brightness;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _theme);
  }
}
