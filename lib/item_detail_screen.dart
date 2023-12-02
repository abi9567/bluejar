import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemDetailScreen extends StatelessWidget {
  const ItemDetailScreen({super.key, required this.titleName, required this.id, required this.image});
  final String titleName;
  final String image;


final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.white,
        elevation: 8,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      body:


      Container(
        width: double.infinity,
        child:
        IntrinsicHeight(
          child: Stack(
            children: [
              CustomPaint(
                size: Size.infinite,
                painter:  BackBorder(),
              ),

              SafeArea(child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleAndDescription(title: "Similar", description: "Flower Pot"),
                        SizedBox(height: 24),
                        TitleAndDescription(title: "Colour", description: "Black & White"),
                        SizedBox(height: 24),
                        TitleAndDescription(title: "Size", description: "Medium"),
                        SizedBox(height: 24),
                        TitleAndDescription(title: "Price", description: "80.99 \$")
                      ],
                    ),
                  ),
                  Expanded(
                    child: Hero(tag: "image_$id",
                        child: Image.asset(image)),
                  )
                ],
              ))
            ],
          ),
        )
      ),
    );
  }
}

class BackBorder extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(
    Path()..lineTo(size.width,0)..lineTo(size.width, 450)..lineTo(0, 500)..close(),
      Paint()..shader = LinearGradient(colors: [Colors.cyan, Colors.black])
    .createShader(
        Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height))
    ));
  }

  @override
  bool shouldRepaint(BackBorder oldDelegate) {
    return false;
  }
}

class TitleAndDescription extends StatelessWidget {
  const TitleAndDescription({super.key, required this.title, required this.description});
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white
            )),

        Text(description,
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 15,
                color: Colors.white
            )),
      ],
    );
  }
}

