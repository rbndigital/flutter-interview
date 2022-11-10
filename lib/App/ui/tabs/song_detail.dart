import 'package:flutter/material.dart';

class SongDetail extends StatefulWidget {
  final Widget? androidDrawer;

  const SongDetail({super.key, this.androidDrawer});

  @override
  State<SongDetail> createState() => _SongDetailState();
}

class _SongDetailState extends State<SongDetail> {
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    String name = arguments['name'].toString();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Song Detail'),
        ),
        drawer: widget.androidDrawer,
        body: Container());
  }
}
