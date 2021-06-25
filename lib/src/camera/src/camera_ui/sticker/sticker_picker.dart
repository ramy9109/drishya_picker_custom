import 'package:drishya_picker/src/draggable_resizable/src/entities/sticker_asset.dart';
import 'package:flutter/material.dart';

import 'sticker_tabs.dart';

///
class StickerPicker extends StatelessWidget {
  ///
  const StickerPicker({
    Key? key,
    required this.initialIndex,
    required this.onStickerSelected,
    required this.onTabChanged,
    required this.bucket,
  }) : super(key: key);

  ///
  final int initialIndex;

  ///
  final ValueSetter<Sticker> onStickerSelected;

  ///
  final ValueSetter<int> onTabChanged;

  ///
  final PageStorageBucket bucket;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return PageStorage(
      bucket: bucket,
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        height: screenHeight, // screenHeight * 0.75,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 32),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Text(
                      'Add props',
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          ?.copyWith(fontSize: 24),
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                Flexible(
                  child: StickersTabs(
                    initialIndex: initialIndex,
                    onTabChanged: onTabChanged,
                    onStickerSelected: onStickerSelected,
                  ),
                ),
              ],
            ),
            Positioned(
              right: 24,
              top: 24,
              child: IconButton(
                key: const Key('stickersDrawer_close_iconButton'),
                icon: const Icon(
                  Icons.clear,
                  color: Colors.black54,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}