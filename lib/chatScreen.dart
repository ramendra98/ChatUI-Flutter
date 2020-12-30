import 'package:chate/chatMessage.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController =
  new TextEditingController();
  final List<ChatMassage>_message = <ChatMassage>[];

  void _handelSubmitted(String text) {
    _textEditingController.clear();
    ChatMassage message = new ChatMassage(text);
    setState(() {
      _message.insert(0, message);
    });
  }

  Widget _textComposerWidget() {
    return new IconTheme(
      data: new IconThemeData(
        color: Colors.blue,
      ),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(child: new TextField(
              decoration: InputDecoration.collapsed(hintText: "Send A message"),
              controller: _textEditingController,
              onSubmitted: _handelSubmitted,
            ),

            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () => _handelSubmitted(_textEditingController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Flexible(
          child: new ListView.builder(
            padding: new EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_, int index) => _message[index],
            itemCount: _message.length,
          ),
        ),
        new Divider(height: 1.0),
        new Container(
          decoration: new BoxDecoration(
            color: Theme
                .of(context)
                .cardColor,
          ),
          child: _textComposerWidget(),
        )
      ],
    );
  }
}
