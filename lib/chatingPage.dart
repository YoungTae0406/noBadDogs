import 'package:flutter/material.dart';
import 'walkman.dart';

void main() {
  runApp(MaterialApp(
    home: Chating(),
  ));
}

class Chating extends StatefulWidget {
  @override
  _ChatingScreenState createState() => _ChatingScreenState();
}

class _ChatingScreenState extends State<Chating> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[
    ChatMessage(
      text:
      '강아지 산책 시키려고 방금 집에서\n나왔는데 어디로 가면 될까요? 저는\n봉명동 근처에 살아서 그냥 바로 나\n와도 될 것 같아요 ㅎㅎㅎ',
      isMyMessage: false,
      backgroundColor: const Color.fromARGB(255, 226, 225, 255), // 보라색 배경
    ),
    ChatMessage(
      text: '시간 되시면 연락 주세요',
      isMyMessage: true,
      backgroundColor: const Color.fromARGB(255, 255, 243, 179), // 오렌지색 배경
    ),
    ChatMessage(
      text: '김민수 님이 산책에 배정되었습니다.',
      isMyMessage: false,
      backgroundColor: const Color.fromARGB(255, 226, 225, 255), // 보라색 배경
    ),
    ChatMessage(
      text: '2시에 산책 가능하신가요?',
      isMyMessage: true,
      backgroundColor: const Color.fromARGB(255, 255, 243, 179), // 오렌지색 배경
    ),
    ChatMessage(
      text: '좋습니다ㅎㅎ 열심히 하겠습니다!',
      isMyMessage: false,
      backgroundColor: const Color.fromARGB(255, 226, 225, 255), // 보라색 배경
    ),
    ChatMessage(
      text: '저희 강아지가 조금 낯을 가리는데 괜찮\n을까요?',
      isMyMessage: true,
      backgroundColor: const Color.fromARGB(255, 255, 243, 179), // 오렌지색 배경
    ),
    ChatMessage(
      text: '아 네넹 반가워요',
      isMyMessage: true,
      backgroundColor: const Color.fromARGB(255, 255, 243, 179), // 오렌지색 배경
    ),
    ChatMessage(
      text: '강아지 산책 시켜드리고 싶어서 연락드렸습니다',
      isMyMessage: false,
      backgroundColor: const Color.fromARGB(255, 226, 225, 255), // 보라색 배경
    ),
    ChatMessage(
      text: '안녕하세요!',
      isMyMessage: false,
      backgroundColor: const Color.fromARGB(255, 226, 225, 255), // 보라색 배경
    ),
  ];

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isMyMessage: true, backgroundColor: const Color.fromARGB(255, 255, 243, 179),
      // 여기에서 사용자 이름, 프로필 이미지 URL 등을 설정할 수 있습니다.
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _buildTextComposer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: InputDecoration.collapsed(
                hintText: '메시지를 입력하세요.',
                hintStyle: TextStyle(fontSize: 20),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              _handleSubmitted(_textController.text);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('김민수', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // 현재 스택에서 이 페이지를 팝하여 이전 페이지로 돌아갑니다.
          },
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Walkman()),
              );
            },
            child: Text(
              '배정하기',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              reverse: true,
              padding: EdgeInsets.all(8.0),
              itemCount: _messages.length,
              itemBuilder: (_, int index) => _messages[index],
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isMyMessage;
  final Color backgroundColor;

  ChatMessage({required this.text, this.isMyMessage = false, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: isMyMessage
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: <Widget>[
          if (!isMyMessage)
            Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('Images/maindog1.png'),
              ),
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: isMyMessage
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: <Widget>[
                if (!isMyMessage)
                  Text(
                    '김민수',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      textAlign: isMyMessage ? TextAlign.end : TextAlign.start,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}