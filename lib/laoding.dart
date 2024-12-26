import 'package:flutter/cupertino.dart';

class LoadingSnippet extends StatelessWidget {
  final String message;

  const LoadingSnippet({Key? key, this.message = "Loading..."})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoActivityIndicator(
            radius: 20, // Adjust the size of the loading spinner
          ),
        ],
      ),
    );
  }
}
