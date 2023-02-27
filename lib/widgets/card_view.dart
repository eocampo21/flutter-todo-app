import 'package:flutter/material.dart';

// Callbacks
typedef EditDeleteItemCallback = void Function(int);

class CardView extends StatelessWidget {
  // Inputs
  final String title;
  final int index;

  // Outputs
  final EditDeleteItemCallback onDeleteClicked;
  final EditDeleteItemCallback onEditClicked;

  const CardView(
      {Key? key,
      required this.title,
      required this.index,
      required this.onEditClicked,
      required this.onDeleteClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      elevation: 2,
      child: Container(
        margin: const EdgeInsets.all(5),
        child: Row(
          children: [
            const Expanded(flex: 2, child: Icon(Icons.home)),
            Expanded(
              flex: 8,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    // leading: const Icon(Icons.album),
                    title: Text(title),
                    subtitle: const Text('Wed 22 Feb 18:29'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('Delete'),
                        onPressed: () {
                          onDeleteClicked(index);
                        },
                      ),
                      // const SizedBox(width: 8),
                      TextButton(
                        child: const Text('Edit'),
                        onPressed: () {
                          onEditClicked(index);
                        },
                      ),
                      // const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
