import 'package:flutter/material.dart';

typedef SubmitBttnClicledCallback = void Function(
    String textFieldValue, int index);

class DialogUtils {
  // Inputs
  late final String title;

  // Outputs
  late final SubmitBttnClicledCallback submitBttn;

  Future<void> showCustomDialog(BuildContext context,
      {required String title,
      String submitBttnText = "Ok",
      required SubmitBttnClicledCallback submitBttnCallback,
      required String hintText,
      String inputValue = '',
      int index = -1}) async {
    final TextEditingController _textFieldController =
        TextEditingController(text: inputValue);

    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (_) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(hintText: hintText),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(submitBttnText),
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                submitBttnCallback(
                    _textFieldController.text, index); // return value to parent
                _textFieldController.clear(); // clean dialog input
              },
            ),
          ],
        );
      },
    );
  }
}
