import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_provider/bloc_with_lib/color_bloc_lib.dart';

class MyBlocApp extends StatelessWidget {
  const MyBlocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ColorBlocLib(),
        child: const BlocWithLibMain(),
      ),
    );
  }
}

class BlocWithLibMain extends StatelessWidget {
  const BlocWithLibMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BLoC with flutter_bloc')),
      body: Center(
        child: BlocBuilder<ColorBlocLib, Color>(
          builder: (context, color) {
            return AnimatedContainer(
              width: 100,
              height: 100,
              color: color,
              duration: const Duration(milliseconds: 500),
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
              context.read<ColorBlocLib>().add(ColorEvent.to_amber);
            },
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            shape: CircleBorder(),
            backgroundColor: Colors.lightBlue,
            onPressed: () {
              context.read<ColorBlocLib>().add(ColorEvent.to_light_blue);
            },
          ),
        ],
      ),
    );
  }
}
