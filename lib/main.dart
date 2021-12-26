import 'package:exam_app/state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => GameState(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      )));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GameState>(
      builder: (context, gameState, child) {
        return Center(
          child: ListView.builder(
            itemCount: gameState.elementCount,
            itemBuilder: (context, index) {
              return Column(children: <Widget>[
                GestureDetector(
                  onTap: () => {gameState.press(index)},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                        color: gameState.getBlockColor(index),
                        width: 150,
                        height: 100,
                        child: Center(
                            child: Text(
                          gameState.getBlockText(index),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              decoration: TextDecoration.none),
                        ))),
                  ),
                ),
              ]);
            },
          ),
        );
      },
    );
  }
}
