import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// Production Grandma shell (shop host).
const String kIhuteGrandmaUrl = 'https://shop.ihute.rw/grandma';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ihute',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const IhuteWebViewPage(),
    );
  }
}

class IhuteWebViewPage extends StatefulWidget {
  const IhuteWebViewPage({super.key});

  @override
  State<IhuteWebViewPage> createState() => _IhuteWebViewPageState();
}

class _IhuteWebViewPageState extends State<IhuteWebViewPage> {
  late final WebViewController _controller;
  int _progress = 0;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (value) {
            setState(() => _progress = value);
          },
        ),
      )
      ..loadRequest(Uri.parse(kIhuteGrandmaUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(child: WebViewWidget(controller: _controller)),
            if (_progress < 100)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: LinearProgressIndicator(
                  value: _progress / 100.0,
                  minHeight: 2,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
