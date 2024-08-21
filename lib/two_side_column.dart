import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Fixed & Scrollable Layout')),
        body: Row(
          children: [
            // Left side: Fixed width widget
            Container(
              width: 200, // Fixed width
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'Fixed Side',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            // Right side: Scrollable widget
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(50, (index) {
                    return ListTile(
                      title: Text('Item ${index + 1}'),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
