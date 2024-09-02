import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:overlay/overlay.dart';

double overlayHeight = 500;
double overlayWidth = 200;
OverlayAlignment alignment = OverlayAlignment.centerRight;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!await FlutterOverlayWindow.isPermissionGranted()) {
    await FlutterOverlayWindow.requestPermission();
  }
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Overlay Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void startOverlay() async {
    if (await FlutterOverlayWindow.isActive()) {
      FlutterOverlayWindow.closeOverlay();
    } else {
      await FlutterOverlayWindow.showOverlay(
        enableDrag: true,
        //  height: 500,
        // width: 500,
        height: 500,
        width: 200,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: GestureDetector(
          onTap: () {},
          child: Text(widget.title),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            startOverlay();
          },
          child: const Text("Start"),
        ),
      ),
    );
  }
}


// overlay entry point
@pragma("vm:entry-point")
void overlayMain() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Material(
      child: SitotaOverlayEnabled(),
    ),
  ));
}
