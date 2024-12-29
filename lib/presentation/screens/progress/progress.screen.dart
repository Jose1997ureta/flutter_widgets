import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Circular Progress Indicator'),
              SizedBox(height: 20),
              CircularProgressIndicator(
                strokeWidth: 3,
                backgroundColor: Colors.black12,
              ),
            ],
          ),
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Linear Progress Indicator'),
              SizedBox(height: 20),
              LinearProgressIndicator(
                backgroundColor: Colors.black12,
              ),
            ],
          ),
          SizedBox(height: 40),
          _ControllerProgressIndicator()
        ],
      ),
    );
  }
}

class _ControllerProgressIndicator extends StatelessWidget {
  const _ControllerProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.periodic(const Duration(milliseconds: 100), (x) {
          return (x * 2) / 100;
        }).takeWhile((x) => x < 100),
        builder: (context, snapshot) {
          final progressValue = snapshot.data ?? 0.0;
          return Column(
            children: [
              const Text('Controller Progress Indicator'),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Center(
                          child: CircularProgressIndicator(
                        value: progressValue,
                      ))),
                  Expanded(
                    flex: 2,
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.black12,
                      value: progressValue,
                    ),
                  )
                ],
              ),
            ],
          );
        });
  }
}
