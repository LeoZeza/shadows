import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: _appbar(context),
        body: ShadowDemo(),
      ),
      
    );
  }
}

_appbar(BuildContext context) {
    final _text = 'Shadows Widgets';
    final _textStyle = TextStyle(
        color: Colors.white,
        fontFamily: "roboto regular",
        fontSize: 15,
        fontWeight: FontWeight.bold);

    return AppBar(
      title: Text(_text, style: _textStyle),
      centerTitle: true,
      backgroundColor: Colors.green.shade700,
      elevation: 0,      
    );
  }

class ShadowDemo extends StatefulWidget {
  @override
  _ShadowDemoState createState() => _ShadowDemoState();
}

class _ShadowDemoState extends State<ShadowDemo> {
  var _opacity = 1.0;
  var _xOffset = 0.0;
  var _yOffset = 0.0;
  var _blurRadius = 0.0;
  var _colorWidgets = Colors.green.shade400;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
            child: Text(
          'Leonardo',
          style: TextStyle(
            fontSize: 88,
            color: _colorWidgets,
            shadows: [
              Shadow(
                color: Colors.green.shade700.withOpacity(_opacity),
                offset: Offset(_xOffset, _yOffset),
                blurRadius: _blurRadius,
              ),
            ],
          ),
        )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 80.0),
            child: Column(
              children: <Widget>[
                Spacer(),                
                Slider(
                  activeColor: _colorWidgets,
                  value: _opacity,
                  min: 0.0,
                  max: 1.0,
                  onChanged: (newValue) =>
                      {setState(() => _opacity = newValue)},
                ),
                Slider(
                  activeColor: _colorWidgets,
                  value: _xOffset,
                  min: -100,
                  max: 100,
                  onChanged: (newValue) =>
                      {setState(() => _xOffset = newValue)},
                ),
                Slider(
                  activeColor: _colorWidgets,
                  value: _yOffset,
                  min: -100,
                  max: 100,
                  onChanged: (newValue) =>
                      {setState(() => _yOffset = newValue)},
                ),
                Slider(
                  activeColor: _colorWidgets,
                  value: _blurRadius,
                  min: 0,
                  max: 100,
                  onChanged: (newValue) =>
                      {setState(() => _blurRadius = newValue)},
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}