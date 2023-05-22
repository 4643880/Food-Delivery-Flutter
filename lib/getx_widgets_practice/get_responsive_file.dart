import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class ResponsiveController extends GetxController {}

class ResponsiveView extends GetResponsiveView<ResponsiveController> {
  ResponsiveView({super.key});

  @override
  Widget builder() {
    return Scaffold(
      appBar: AppBar(title: const Text('ResponsivePage')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text('Resize the screen to see the results',
              style: TextStyle(fontSize: 35)),
          _drawLine(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _getIcon(Icons.desktop_windows, ScreenType.Desktop),
              _getIcon(Icons.tablet, ScreenType.Tablet),
              _getIcon(Icons.phone, ScreenType.Phone),
              _getIcon(Icons.watch, ScreenType.Watch),
            ],
          ),
          Text(screen.screenType.toString(),
              style: const TextStyle(fontSize: 35)),
          _drawLine(),
          const Text('ResponsiveViewCases', style: TextStyle(fontSize: 35)),
          _drawLine(),
          Text(
            'Or you can set specific value depending  on the screnn type',
            style: TextStyle(
              fontSize: 35,
              color: screen.responsiveValue(
                  desktop: Colors.indigo,
                  tablet: Colors.yellow,
                  mobile: Colors.red,
                  watch: Colors.black),
            ),
          ),
          ResponsiveViewCases(),
          _drawLine(),
          const Text('ResponsiveViewCases1', style: TextStyle(fontSize: 35)),
          ResponsiveViewCases1(),
          // _drawLine(),
          // const Text('ResponsiveViewCustomSettings',
          //     style: TextStyle(fontSize: 35)),
          // ResponsiveViewCustomSettings(),
        ],
      ),
    );
  }

  Widget _drawLine() => Container(
        width: double.infinity,
        height: 2,
        color: Colors.indigo,
      );

  Widget _getIcon(IconData icon, ScreenType type) {
    return AnimatedContainer(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: screen.screenType == type ? Colors.amber : Colors.transparent,
        borderRadius: BorderRadius.circular(5),
      ),
      duration: 1.seconds,
      child: Icon(
        icon,
        size: screen.screenType == ScreenType.Phone ? 50 : 20,
        color: Colors.indigo,
      ),
    );
  }
}

class ResponsiveViewCases extends GetResponsiveView<ResponsiveController> {
  ResponsiveViewCases({super.key}) : super(alwaysUseBuilder: false);

  @override
  Widget phone() => const Icon(Icons.phone, size: 75);

  @override
  Widget desktop() => Container(
        color: screen.isTablet ? Colors.red : Colors.indigo,
        child: const Icon(Icons.desktop_windows, size: 75),
      );
}

class ResponsiveViewCases1 extends GetResponsiveView<ResponsiveController> {
  ResponsiveViewCases1({super.key});

  @override
  Widget builder() => screen.isDesktop
      ? Container(
          color: screen.isTablet ? Colors.red : Colors.indigo,
          child: const Icon(Icons.desktop_windows, size: 75))
      : screen.isPhone
          ? const Icon(Icons.phone, size: 75)
          : const Icon(Icons.info, size: 75);
}

class ResponsiveViewCustomSettings
    extends GetResponsiveView<ResponsiveController> {
  ResponsiveViewCustomSettings({super.key})
      : super(
          settings: const ResponsiveScreenSettings(
              desktopChangePoint: 800,
              tabletChangePoint: 700,
              watchChangePoint: 600),
        );

  @override
  Widget builder() => Column(
        children: [
          const Text('Desktop up 800, Tablet up 700 watch up 600',
              style: TextStyle(fontSize: 35)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(screen.width.toString(),
                  style: const TextStyle(fontSize: 35)),
              Text(
                screen.screenType.toString(),
                style: const TextStyle(fontSize: 35),
              ),
            ],
          ),
        ],
      );
}

// GetResponsive provides screen types 
// GetView Similar to get.find , don't create cache
// Getwidget Similar to get.find create cache of controller 