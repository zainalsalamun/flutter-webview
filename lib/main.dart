import 'dart:async';
import 'dart:io'; // Add this import.
import 'package:flutter/material.dart';
import 'package:flutter_webview/src/menu.dart';
import 'package:flutter_webview/src/navigation_control.dart';
import 'package:flutter_webview/web_view_stack.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(
    const MaterialApp(
      home: WebViewApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({Key? key}) : super(key: key);

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  // Add from here ...
  final controller = Completer<WebViewController>();

  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    super.initState();
  }
  // ... to here.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        //title: const Text('Flutter WebView'),
        // actions: [
        //   NavigationControls(controller: controller),
        //   Menu(controller: controller),
        // ],
      ),
      body: WebViewStack(controller: controller),
    );
  }
}
