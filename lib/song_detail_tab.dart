// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'pressable_card.dart';

/// Page shown when a card in the songs tab is tapped.
///
/// On Android, this page sits at the top of your app. On iOS, this page is on
/// top of the songs tab's content but is below the tab bar itself.
class SongDetailTab extends StatelessWidget {
  const SongDetailTab({
    required this.id,
    required this.song,
    required this.color,
    super.key,
  });

  final int id;
  final String song;
  final Color color;

  Widget _buildBody(BuildContext context) {
    Animation<double> heroAnimation = const AlwaysStoppedAnimation(1);
    return SafeArea(
      bottom: false,
      left: false,
      right: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
            tag: id,
            child: AnimatedBuilder(
              animation: heroAnimation,
              builder: (context, child) {
                return PressableCard(
                  color: color,
                  flattenAnimation: heroAnimation,
                  child: Container(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // The song title banner slides off in the hero animation.
                        Container(
                          height: 80,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            song,
                            style: const TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        // The play button grows in the hero animation.
                        Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Icon(Icons.play_arrow,
                              size: 50 + 50 * heroAnimation.value,
                              color: Colors.black38),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            // This app uses a flightShuttleBuilder to specify the exact widget
            // to build while the hero transition is mid-flight.
            //
            // It could either be specified here or in SongsTab.
            flightShuttleBuilder: (context, animation, flightDirection,
                fromHeroContext, toHeroContext) {
              return AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return PressableCard(
                    color: color,
                    flattenAnimation: animation,
                    child: Container(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // The song title banner slides off in the hero animation.
                          Container(
                            height: 80,
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              song,
                              style: const TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          // The play button grows in the hero animation.
                          Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Icon(Icons.play_arrow,
                                size: 50 + 50 * animation.value,
                                color: Colors.black38),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
          const Divider(
            height: 0,
            color: Colors.grey,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const Padding(
                    padding: EdgeInsets.only(left: 15, top: 16, bottom: 8),
                    child: Text(
                      'You might also like:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }
                // Just a bunch of boxes that simulates loading song choices.
                return Container(
                  height: 95,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Row(
                      children: [
                        Container(
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                          width: 130,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 12),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 9,
                                margin: const EdgeInsets.only(right: 60),
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color,
                              ),
                              Container(
                                height: 9,
                                margin:
                                    const EdgeInsets.only(right: 20, top: 8),
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color,
                              ),
                              Container(
                                height: 9,
                                margin:
                                    const EdgeInsets.only(right: 40, top: 8),
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color,
                              ),
                              Container(
                                height: 9,
                                margin:
                                    const EdgeInsets.only(right: 80, top: 8),
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color,
                              ),
                              Container(
                                height: 9,
                                margin:
                                    const EdgeInsets.only(right: 50, top: 8),
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // ===========================================================================
  // Non-shared code below because we're using different scaffolds.
  // ===========================================================================

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(song)),
      body: _buildBody(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(song),
        previousPageTitle: 'Songs',
      ),
      child: _buildBody(context),
    );
  }

  @override
  Widget build(context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return _buildAndroid(context);
      case TargetPlatform.iOS:
        return _buildIos(context);
      default:
        assert(false, 'Unexpected platform $defaultTargetPlatform');
        return const SizedBox.shrink();
    }
  }
}
