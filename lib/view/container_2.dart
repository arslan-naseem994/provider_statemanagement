import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/provider/container_provider.dart';

class ContainerScreen extends StatefulWidget {
  const ContainerScreen({super.key});

  @override
  State<ContainerScreen> createState() => _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen> {
  final values = 0.0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    // final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('ContainerProviderScreen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<ContainerProvider>(builder: ((context, value, child) {
              return Slider(
                  min: 0,
                  max: 1,
                  value: value.value,
                  onChanged: (val) {
                    value.setValue(val);
                  });
            })),
            const Text('Slider'),
            Consumer<ContainerProvider>(builder: ((context, value, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 80,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(value.value)),
                  ),
                  SizedBox(
                    width: width / 20,
                  ),
                  Container(
                    height: 80,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(value.value)),
                  ),
                ],
              );
            }))
          ],
        ),
      ),
    );
  }
}
