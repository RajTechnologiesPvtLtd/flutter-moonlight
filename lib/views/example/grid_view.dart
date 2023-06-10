import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(title: "Grid View"),
      body: GridView.count(
        primary: true,
        padding: const EdgeInsets.all(1.0),
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
        children: [
          getStructuredGridCell("Facebook", "logo.jpg"),
          getStructuredGridCell("Twitter", "logo.jpg"),
          getStructuredGridCell("Instagram", "logo.jpg"),
          getStructuredGridCell("Linkedin", "logo.jpg"),
          getStructuredGridCell("Google Plus", "logo.jpg"),
          getStructuredGridCell("Launcher Icon", "logo.jpg"),
        ],
      ),
    );
  }
}

GestureDetector getStructuredGridCell(name, image) {
  return GestureDetector(
    onTap: () {
      print("onTap called.");
    },
    child: Card(
        elevation: 1.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Image(image: AssetImage("assets/images/$image")),
            Center(
              child: Text(name),
            )
          ],
        )),
  );
}
