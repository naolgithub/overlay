import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:overlay/main.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SitotaOverlayEnabled extends StatefulWidget {
  const SitotaOverlayEnabled({super.key});

  @override
  State<SitotaOverlayEnabled> createState() => _SitotaOverlayEnabledState();
}

class _SitotaOverlayEnabledState extends State<SitotaOverlayEnabled> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..loadRequest(Uri.parse('https://www.youtube.com/'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 20,
      // height: 150,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () async {
              await FlutterOverlayWindow.closeOverlay();
            },
            child: const Icon(
              Icons.close,
              color: Colors.blue,
              size: 40,
            ),
          ),
          InkWell(
            onTap: () async {
              overlayHeight = 1200;
              overlayWidth = 1200;
              // overlayWidth = MediaQuery.of(context).size.width ;
              // overlayHeight = MediaQuery.of(context).size.height * 0.5;
              alignment = OverlayAlignment.bottomCenter;
              await FlutterOverlayWindow.closeOverlay();
              // await FlutterOverlayWindow.resizeOverlay(width, height, enableDrag);
              await FlutterOverlayWindow.showOverlay(
                enableDrag: true,
                alignment: alignment,
                // height: (overlayHeight).toInt(),
                // width: (overlayWidth).toInt(),
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>

                      // Scaffold(
                      //   // backgroundColor: Colors.blue,
                      //   // appBar: AppBar(
                      //   //   title: const Text("appbar title"),
                      //   //   centerTitle: true,
                      //   //   leading: InkWell(
                      //   //     onTap: () async {
                      //   //       await FlutterOverlayWindow.closeOverlay();
                      //   //       overlayWidth = 200;
                      //   //       overlayHeight = 500;
                      //   //       Navigator.pop(context);
                      //   //       await FlutterOverlayWindow.showOverlay(
                      //   //         enableDrag: true,
                      //   //         alignment: OverlayAlignment.centerRight,
                      //   //         height: overlayHeight.toInt(),
                      //   //         width: overlayWidth.toInt(),
                      //   //       );
                      //   //     },
                      //   //     child: const Icon(Icons.close),
                      //   //   ),
                      //   // ),
                      //   body: SafeArea(
                      //     child: Container(
                      //         decoration: const BoxDecoration(
                      //           color: Colors.blue, // Set the container's color
                      //           borderRadius: BorderRadius.only(
                      //             topLeft: Radius.circular(20),
                      //             topRight: Radius.circular(20),
                      //           ),
                      //           gradient: LinearGradient(
                      //             colors: [
                      //               Colors.blue,
                      //               Colors.purple
                      //             ], // Define the gradient colors
                      //             begin: Alignment
                      //                 .topLeft, // Starting point of the gradient
                      //             end: Alignment
                      //                 .bottomRight, // Ending point of the gradient
                      //           ),
                      //         ),
                      //         child: Column(
                      //           children: [
                      //             Row(
                      //               mainAxisAlignment:
                      //                   MainAxisAlignment.spaceBetween,
                      //               children: [
                      //                 const Padding(
                      //                   padding: EdgeInsets.only(left: 20),
                      //                   child: Text(
                      //                     "hello",
                      //                     style: TextStyle(
                      //                       fontSize: 30,
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 InkWell(
                      //                   onTap: () async {
                      //                     await FlutterOverlayWindow.closeOverlay();
                      //                     overlayWidth = 200;
                      //                     overlayHeight = 500;
                      //                     Navigator.pop(context);
                      //                     await FlutterOverlayWindow.showOverlay(
                      //                       enableDrag: true,
                      //                       alignment: OverlayAlignment.centerRight,
                      //                       height: overlayHeight.toInt(),
                      //                       width: overlayWidth.toInt(),
                      //                     );
                      //                   },
                      //                   child: const Icon(
                      //                     color: Colors.red,
                      //                     size: 30,
                      //                     Icons.close,
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //             // Use Flexible or Expanded here
                      //             const Flexible(
                      //               child: SingleChildScrollView(
                      //                 child: Column(
                      //                   children: [
                      //                     Text("data"),
                      //                     Text("data"),
                      //                     Text("data"),
                      //                     Text("data"),
                      //                     Text("data"),
                      //                     Text("data"),
                      //                     Text("data"),
                      //                     Text("data"),
                      //                     Text("data"),
                      //                     Text("data"),
                      //                     Text("data"),
                      //                     Text("data"),
                      //                     Text("nao"),
                      //                     Text("nao"),
                      //                     Text("nao"),
                      //                     Text("nao"),
                      //                     Text("nao"),
                      //                     Text("nao"),
                      //                     Text("nao"),
                      //                     Text("nao"),
                      //                     Text("nao"),
                      //                     Text("nao"),
                      //                     Text("nao"),
                      //                     Text("nao"),
                      //                   ],
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         )),
                      //   ),
                      // ),
                      WebViewWidget(controller: _controller),
                ),
              );
            },
            child: const Icon(
              Icons.settings,
              color: Colors.grey,
              size: 30,
            ),
          ),
          const Icon(
            Icons.open_with,
            color: Colors.grey,
            size: 40,
          ),
        ],
      ),
    );
  }
}
