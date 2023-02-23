import 'package:flutter/material.dart';

import '../../main.dart';

typedef ItemSelectedCallback = void Function(String);

class CardView extends StatelessWidget {
  /// Input
  final List<Todo> list;

  const CardView({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: list.map((Todo todo) {
        return SafeArea(
          child: Column(
            children: [
              Card(
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
                              title: Text(todo.name),
                              subtitle: const Text('Wed 22 Feb 18:29'),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                TextButton(
                                  child: const Text('Delete'),
                                  onPressed: () {/* ... */},
                                ),
                                // const SizedBox(width: 8),
                                TextButton(
                                  child: const Text('Edit'),
                                  onPressed: () {/* ... */},
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
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

mixin MixinCardView on StatelessWidget {
  // you can also constrain the mixin to specific classes using on in this line.
  mixinCardView() {
    return null;
    // Add web view logic here. We can add variables to the mixin itself as well.
  }
}
