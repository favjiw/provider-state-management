import 'package:flutter/material.dart';
import 'package:learn_provider/provider_1/application_color.dart';
import 'package:provider/provider.dart';

class Provider1Main extends StatelessWidget {
  const Provider1Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<ApplicationColor>(
        create: (context) => ApplicationColor(),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Consumer<ApplicationColor>(
              builder:
                  (context, applicationColor, _) => Text(
                'Provider State Management',
                style: TextStyle(color: applicationColor.color),
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<ApplicationColor>(
                  builder:
                      (context, applicationColor, _) => AnimatedContainer(
                    margin: EdgeInsets.all(5),
                    width: 100,
                    height: 100,
                    color: applicationColor.color,
                    duration: Duration(milliseconds: 500),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(margin: EdgeInsets.all(5), child: Text('AB')),
                    Consumer<ApplicationColor>(
                      builder:
                          (context, applicationColor, _) =>
                          Switch(value: applicationColor.isLightBlue, onChanged: (newValue) {
                            applicationColor.isLightBlue = newValue;
                          }),
                    ),
                    Container(margin: EdgeInsets.all(5), child: Text('LB')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
