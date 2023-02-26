import 'package:flutter/material.dart';

typedef SubmitBttnClicledCallback = void Function(String textFieldValue);

class DialogUtils {
  // Inputs
  late final String title;

  // Outputs
  late final SubmitBttnClicledCallback submitBttn;

  final TextEditingController _textFieldController = TextEditingController();

  // ignore: unused_element
  Future<void> showCustomDialog(BuildContext context,
      {required String title,
      String submitBttnText = "Ok",
      required SubmitBttnClicledCallback submitBttnCallback,
      required String hintText}) async {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
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
                    _textFieldController.text); // return value to parent
                _textFieldController.clear(); // clean dialog input
              },
            ),
          ],
        );
      },
    );
  }
}
