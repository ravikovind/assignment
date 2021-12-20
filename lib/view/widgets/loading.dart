import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final String eventName;
  const Loading({Key? key, this.eventName = "Loading..."}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              strokeWidth: 6.0,
              backgroundColor: Colors.black12,
            ),
            const SizedBox(height: 16),
            Text(
              eventName,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
