import 'package:flutter/material.dart';

Future<List<String>?> showMultiSelect(BuildContext context, List<String> items,String title) async {
  List<String> selectedItems = [];

  return await showDialog<List<String>>(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title:   Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                  height: 20, // Adds spacing between the title and the divider
                ),
              ],
            ),
            content: SingleChildScrollView(
              child: Column(
                children: items.map((item) {
                  int index = items.indexOf(item);
                  return Column(
                    children: [
                      CheckboxListTile(
                        value: selectedItems.contains(item),
                        title: Text(item),
                        onChanged: (bool? selected) {
                          setState(() {
                            if (selected == true) {
                              selectedItems.add(item);
                            } else {
                              selectedItems.remove(item);
                            }
                          });
                        },
                      ),
                      // Add divider except after the last item
                      if (index < items.length )
                        const Divider(
                          color: Colors.grey,
                          thickness: 1,
                          height: 1,
                        ),
                    ],
                  );
                }).toList(),
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the dialog without saving
                    },
                    child: const Text('CANCEL'),
                  ),
                  const VerticalDivider(
                    thickness: 1,
                    color: Colors.yellow,
                    width: 20, // Adjusts the spacing between the buttons
                  ),
                  const Text('CLEAR ALL'),
                  const VerticalDivider(
                    thickness: 1,
                    color: Colors.yellow,
                    width: 20, // Adjusts the spacing between the buttons
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context, selectedItems); // Return selected items
                      },
                      child: const Text('DONE'),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      );
    },
  );
}
