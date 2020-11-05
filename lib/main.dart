import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());
final audioPlayer = AudioCache();
final xyloButtonMap = <String, Color>{
  'note1.wav': Colors.red,
  'note2.wav': Colors.orange,
  'note3.wav': Colors.yellow,
  'note4.wav': Colors.green,
  'note5.wav': Colors.teal,
  'note6.wav': Colors.blue,
  'note7.wav': Colors.purple,
};

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <XyloButton>[
                for (var item in xyloButtonMap.entries)
                  XyloButton(filename: item.key, color: item.value)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class XyloButton extends StatelessWidget {
  final String filename;
  final Color color;

  const XyloButton({Key key, @required this.filename, @required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
          onPressed: () {
            audioPlayer.play(filename);
          },
          color: color,
          child: null),
    );
  }
}
