// ignore_for_file: prefer_adjacent_string_concatenation, unnecessary_string_interpolations

import 'package:flutter/material.dart';

import '../../constanins.dart';
import '../../home_controller.dart';
import 'tmp_btn.dart';


class TempDetails extends StatelessWidget {
  const TempDetails({
    Key? key,
    required HomeController controller,
  })  : _controller = controller,
        super(key: key);

  final HomeController _controller;

  @override
  Widget build(BuildContext context) {
    // Check the current orientation
    final orientation = MediaQuery.of(context).orientation;

    // Choose the appropriate content based on orientation
    final content = orientation == Orientation.portrait
        ? _buildPortraitContent(context)
        : _buildLandscapeContent(context);

    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: content,
    );
  }

  Widget _buildPortraitContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 120,
          child: Row(
            children: [
              TempBtn(
                isActive: _controller.isCoolSelected,
                svgSrc: "assets/icons/coolShape.svg",
                title: "Cool",
                press: _controller.updateCoolSelectedTab,
              ),
              const SizedBox(width: defaultPadding),
              TempBtn(
                isActive: !_controller.isCoolSelected,
                svgSrc: "assets/icons/heatShape.svg",
                title: "Heat",
                activeColor: redColor,
                press: _controller.updateCoolSelectedTab,
              ),
            ],
          ),
        ),
        const Spacer(),
        Column(
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                _controller.updateTemperature(1);
              },
              icon: const Icon(Icons.arrow_drop_up, size: 48),
            ),
            Text(
              "${_controller.temperature.toStringAsFixed(0)}" + "\u2103",
              style: const TextStyle(fontSize: 86),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                _controller.updateTemperature(-1);
              },
              icon: const Icon(Icons.arrow_drop_down, size: 48),
            ),
          ],
        ),
        const Spacer(),
        const Text("CURRENT TEMPERATURE"),
        const SizedBox(height: 13),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Inside".toUpperCase()),
                Text(
                  "20" + "\u2103",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            const SizedBox(width: defaultPadding),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Inside".toUpperCase(),
                  style: const TextStyle(color: Colors.white54),
                ),
                Text(
                  "35" + "\u2103",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Colors.white54),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLandscapeContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TempBtn(
          isActive: _controller.isCoolSelected,
          svgSrc: "assets/icons/coolShape.svg",
          title: "Cool",
          press: _controller.updateCoolSelectedTab,
        ),
        TempBtn(
          isActive: !_controller.isCoolSelected,
          svgSrc: "assets/icons/heatShape.svg",
          title: "Heat",
          activeColor: redColor,
          press: _controller.updateCoolSelectedTab,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  _controller.updateTemperature(1);
                },
                icon: const Icon(Icons.arrow_drop_up, size: 48),
              ),
              Text(
                "${_controller.temperature.toStringAsFixed(0)}" + "\u2103",
                style: const TextStyle(fontSize: 86),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  _controller.updateTemperature(-1);
                },
                icon: const Icon(Icons.arrow_drop_down, size: 48),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Inside".toUpperCase()),
            Text(
              "20" + "\u2103",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Inside".toUpperCase(),
              style: const TextStyle(color: Colors.white54),
            ),
            Text(
              "35" + "\u2103",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.white54),
            ),
          ],
        ),
      ],
    );
  }
}
