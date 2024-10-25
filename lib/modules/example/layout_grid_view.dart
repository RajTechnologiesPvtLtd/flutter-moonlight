import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const Navbar(title: "Grid View"),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.blue,
                              // Add your content for the first column's first row here
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.green,
                              // Add your content for the first column's second row here
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.orange,
                              // Add your content for the second column's first row here
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    color: Colors.red,
                                    // Add your content for the second column's second row here
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    color: Colors.yellow,
                                    // Add your content for the second column's second row here
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
