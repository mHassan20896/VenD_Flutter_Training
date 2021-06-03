class ChatManager {
  Map<String, String> _chatHistory = {
    "${DateTime.now()}them": "Hi",
    "${DateTime.now().add(Duration(minutes: 1))}me": "hello!"
  };

  List<String> sender = [];

  ChatManager() {
    sender = _chatHistory.keys.toList();
    sender.sort();
  }

  message(String key) => _chatHistory[key];

  send(String sender, String message) {
    String senderKey = "${DateTime.now()}$sender";
    _chatHistory[senderKey] = message;
    this.sender.add(senderKey);
  }
}
