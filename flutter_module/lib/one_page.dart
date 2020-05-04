import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

class OnePage extends StatefulWidget {
  final Map param;

  OnePage(this.param);

  @override
  State<StatefulWidget> createState() {
    return _OnePageState();
  }
}

class _OnePageState extends State<OnePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OnePage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 如果接收到参数则显示，OneKey为传递map中的key
            Text(widget.param == null ? "未接收到参数" : widget.param["OneKey"]),
            RaisedButton(
                child: Text("调回Android界面"),
                onPressed: () {
                  // url://nativePage为PageRouter界面定义的，flutter调起Android界面
                  FlutterBoost.singleton.open("url://nativePage",
                      urlParams: {"native": "我是参数乙"});
                }),
            RaisedButton(
                child: Text("关闭当前界面"),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ],
        ),
      ),
    );
  }
}