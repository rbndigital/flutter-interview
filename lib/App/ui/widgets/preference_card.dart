import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:platform_design/App/ui/widgets/pressable_card.dart';

class PreferenceCard extends StatelessWidget {
  const PreferenceCard({
    required this.header,
    required this.content,
    required this.preferenceChoices,
    super.key,
  });

  final String header;
  final String content;
  final List<String> preferenceChoices;

  @override
  Widget build(context) {
    return PressableCard(
      color: Colors.green,
      flattenAnimation: const AlwaysStoppedAnimation(0),
      child: Stack(
        children: [
          Container(
            height: 120,
            width: 250,
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Center(
                child: Text(
                  content,
                  style: const TextStyle(fontSize: 48),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black12,
              height: 40,
              padding: const EdgeInsets.only(left: 12),
              alignment: Alignment.centerLeft,
              child: Text(
                header,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
      onPressed: () {
        List<String> choices = preferenceChoices;
        switch (defaultTargetPlatform) {
          case TargetPlatform.android:
            showDialog<void>(
              context: context,
              builder: (context) {
                int? selectedRadio = 1;
                return AlertDialog(
                  contentPadding: const EdgeInsets.only(top: 12),
                  content: StatefulBuilder(
                    builder: (context, setState) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children:
                            List<Widget>.generate(choices.length, (index) {
                          return RadioListTile<int?>(
                            title: Text(choices[index]),
                            value: index,
                            groupValue: selectedRadio,
                            onChanged: (value) {
                              setState(() => selectedRadio = value);
                            },
                          );
                        }),
                      );
                    },
                  ),
                  actions: [
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    TextButton(
                      child: const Text('CANCEL'),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                );
              },
            );
            return;
          case TargetPlatform.iOS:
            showCupertinoModalPopup<void>(
              context: context,
              builder: (context) {
                return Container(
                  height: 250,
                  child: CupertinoPicker(
                    backgroundColor: Theme.of(context).canvasColor,
                    useMagnifier: true,
                    magnification: 1.1,
                    itemExtent: 40,
                    scrollController:
                        FixedExtentScrollController(initialItem: 1),
                    children: List<Widget>.generate(choices.length, (index) {
                      return Center(
                        child: Text(
                          choices[index],
                          style: const TextStyle(
                            fontSize: 21,
                          ),
                        ),
                      );
                    }),
                    onSelectedItemChanged: (value) {},
                  ),
                );
              },
            );
            return;
          default:
            assert(false, 'Unexpected platform $defaultTargetPlatform');
        }
      },
    );
  }
}
