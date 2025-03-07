import 'package:flutter/material.dart';
import 'package:learn_provider/bloc_without_lib/color_bloc.dart';

class BlocWithoutLibMain extends StatefulWidget {
  const BlocWithoutLibMain({super.key});

  @override
  State<BlocWithoutLibMain> createState() => _BlocWithoutLibMainState();
}

class _BlocWithoutLibMainState extends State<BlocWithoutLibMain> {
  ColorBloc bloc = ColorBloc();
  @override
  void dispose() {
    bloc.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('BLoC tanpa Library')),
        body: Center(
          child: StreamBuilder(
            stream: bloc.stateStream,
            initialData: Colors.amber,
            builder: (context, snapshot) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: 100,
                height: 100,
                color: snapshot.data,
              );
            },
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              shape: CircleBorder(),
              backgroundColor: Colors.amber,
              onPressed: () {
                bloc.eventSink.add(ColorEvent.to_amber);
              },
            ),
            SizedBox(width: 10),
            FloatingActionButton(
              shape: CircleBorder(),
              backgroundColor: Colors.lightBlue,
              onPressed: () {
                bloc.eventSink.add(ColorEvent.to_light_blue);
              },
            ),
          ],
        ),
      ),
    );
  }
}
