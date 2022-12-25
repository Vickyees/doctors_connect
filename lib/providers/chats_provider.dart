import '../models/message.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'chat_bot.dart';

class ChatsProvider with ChangeNotifier {
  String url = '';
  String reply = '';
  var _botReplyList = [];
  var data;

  var _chats = [
    Message(
        id: DateTime.now().toString(),
        createdAt: DateTime.now(),
        isMe: false,
        text: "Hi! Vignesh"),
    Message(
        id: DateTime.now().toString(),
        createdAt: DateTime.now(),
        isMe: false,
        text: "I'm Docbot, your anytime medical assistant."),
  ];

  List get chats {
    return _chats;
  }

  void addToBotReplyList(message) {
    _botReplyList.add(message);
  }

  void addChat(message) async {
    _chats.add(Message(
        id: DateTime.now().toString(),
        text: message,
        createdAt: DateTime.now(),
        isMe: true));
    notifyListeners();

    if (_botReplyList.isNotEmpty) {
      if (_botReplyList[_botReplyList.length - 1] ==
          'Which disease you want to know about?...') {
        var reply = await getDiseaseInfo(message);
        var diseaseInfo = reply['disease'];
        String diagnosis = "Diagnosis: \n\n${diseaseInfo['diagnosis']}\n";
        String facts =
            "\nFacts: \n\n*${diseaseInfo['facts'][0]} \n\n*${diseaseInfo['facts'][1]}";
        String prevention = "Prevention: \n${diseaseInfo['prevention']}";
        String symptoms = "Symptoms: \n${diseaseInfo['transmission']}";
        String transmission = "Transmission: \n${diseaseInfo['transmission']}";
        String treatment = "Treatment: \n${diseaseInfo['treatment']}";
        String diseaseInfoFormatted =
            "${diagnosis}${facts}\n\n${prevention}\n\n${symptoms}\n\n${transmission}\n\n${treatment}";

        _chats.add(Message(
            id: DateTime.now().toString(),
            text: diseaseInfoFormatted,
            createdAt: DateTime.now(),
            isMe: false));
        notifyListeners();
        addToBotReplyList(diseaseInfoFormatted);
        return;
      }
    }

    if (_botReplyList.isNotEmpty) {
      if (_botReplyList[_botReplyList.length - 1] ==
          "May I know your symptoms🙄") {
        var reply = await predictDisease(message);
        var formattedResult = '';
        for (int i = 0; i < 10; i++) {
          formattedResult += "${reply[i]}\n";
        }
        _chats.add(Message(
            id: DateTime.now().toString(),
            text: formattedResult.trim(),
            createdAt: DateTime.now(),
            isMe: false));
        notifyListeners();
        addToBotReplyList(formattedResult.trim());
        return;
      }
    }

    if (message.contains('about') ||
        message.contains('info') ||
        message.contains('details') ||
        message.contains('information')) {
      reply = 'Which disease you want to know about?...';
    } else {
      reply = await getBotReply(message);
    }
    _chats.add(Message(
        id: DateTime.now().toString(),
        text: reply,
        createdAt: DateTime.now(),
        isMe: false));
    notifyListeners();
    addToBotReplyList(reply);
  }
}
