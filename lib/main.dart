import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdg_dms/build_text_btn.dart';
import 'package:mdg_dms/multiple_select_dialog.dart';
import 'package:mdg_dms/searchfield_filter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sale App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              hyperSearchAndFilter(context, () {}),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton('Choose Township', () {
                    showMultiSelect(
                            context,
                            ['Township 1', 'Township 2', 'Township 3'],
                            'Choose Township')
                        .then((value) {
                      if (value != null) {
                        setState(() {
                          selectedItems = value;
                        });
                      }
                    });
                  }),
                  buildButton('Choose Frequency', () {
                    showMultiSelect(
                            context,
                            [
                              'Flutter',
                              'Node Js',
                              'Js script',
                              'MySQL',
                              'Docker'
                            ],
                            'Choose Frequency')
                        .then((value) {
                      if (value != null) {
                        setState(() {
                          selectedItems = value;
                        });
                      }
                    });
                  }),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
