import 'package:flutter/material.dart';
import 'package:strichestreichen/custom_painter.dart';

class LineCanvas extends StatefulWidget {
  const LineCanvas({Key? key}) : super(key: key);

  @override
  State<LineCanvas> createState() => _LineCanvasState();
}

class _LineCanvasState extends State<LineCanvas> {
  List points = [];

  var winsP1 = 0;
  var winsP2 = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var heigth = MediaQuery.of(context).size.height;

    revertLast() {
      points.removeLast(); // Remove Null
      for (var i = points.length - 1; i > 0; i--) {
        if (points[i] == null) return;
        points.removeLast();
      }
      points.add(null);
      setState(() {});
    }

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          height: heigth * 0.2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: Column(
                  children: [
                    const Text("Player 1"),
                    const Spacer(),
                    Text(winsP1.toString(),
                        style: const TextStyle(fontSize: 46)),
                    const Spacer(),
                  ],
                ),
                onPressed: () => {
                  setState(() {
                    points = [];
                    winsP1++;
                  })
                },
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("vs.", style: TextStyle(fontSize: 46)),
              ),
              ElevatedButton(
                child: Column(
                  children: [
                    const Text("Player 2"),
                    const Spacer(),
                    Text(winsP2.toString(),
                        style: const TextStyle(fontSize: 46)),
                    const Spacer(),
                  ],
                ),
                onPressed: () => {
                  setState(() {
                    points = [];
                    winsP2++;
                  })
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    child: const Text("Clear Score"),
                    onPressed: () => {
                      setState(() {
                        winsP1 = 0;
                        winsP2 = 0;
                        points = [];
                      })
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                    ),
                    onPressed: () => revertLast(),
                    child: const Icon(
                      Icons.undo,
                      size: 60,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          width: width,
          height: heigth * 0.80,
          color: Colors.yellow[100],
          child: GestureDetector(
            onPanDown: (details) => {
              setState(() {
                points.add((details.localPosition));
              })
            },
            onPanUpdate: (details) => {
              setState(() {
                points.add((details.localPosition));
              })
            },
            onPanEnd: (details) => {
              setState(() {
                points.add(null);
              })
            },
            child: CustomPaint(
              painter: MyCustomPainter(points: points),
            ),
          ),
        ),
      ],
    );
  }
}
