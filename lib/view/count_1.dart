import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/constants/textstyle.dart';
import 'package:provider_state/provider/count_provider.dart';

class CountScreen extends StatefulWidget {
  const CountScreen({super.key});

  @override
  State<CountScreen> createState() => _CountScreenState();
}

class _CountScreenState extends State<CountScreen> {
  @override
  Widget build(BuildContext context) {
    debugPrint('WholeWidget');

    // for using provider class must add this line of code
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    //
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'CountProviderScreen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Consumer<CountProvider>(
              builder: ((context, value, child) {
                debugPrint('Text_Widget');
                return Text(
                  value.count.toString(),
                  style: myTextStyle,
                );
              }),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: const Center(
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
