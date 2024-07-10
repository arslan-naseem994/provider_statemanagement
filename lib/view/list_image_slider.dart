import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:provider_state/constants/textstyle.dart';
import 'package:provider_state/provider/img_provider.dart';

class ListImageProvider extends StatefulWidget {
  const ListImageProvider({super.key});

  @override
  State<ListImageProvider> createState() => _ListImageProviderState();
}

class _ListImageProviderState extends State<ListImageProvider> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    debugPrint('${i++}');
    debugPrint('ScaffoldWidget');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Containers'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Consumer<ImgProvider>(builder: ((context, value, child) {
            debugPrint('TextWidget');
            return Text(
              value.value.toStringAsFixed(2),
              style: myTextStyle,
            );
          }))),
          Center(
            child: Consumer<ImgProvider>(builder: ((context, value, child) {
              debugPrint('SliderWidget');
              return Slider(
                  min: 0,
                  max: 2,
                  value: value.value,
                  onChanged: (val) {
                    value.setValue(val);
                  });
            })),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<ImgProvider>(
                builder: ((context, value, child) {
                  // int imageIndex = value.value
                  //     .round(); // Get the rounded value from the slider
                  // if (imageIndex >= value.images.length) {
                  //   imageIndex = value.images.length -
                  //       1; // Ensure the index is within bounds
                  // }
                  return Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: const BoxDecoration(color: Colors.blue),
                    child: Image(
                      fit: BoxFit.fitHeight,
                      image: NetworkImage(value.imagess[value.value.toInt()]),
                    ),
                  );
                }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
