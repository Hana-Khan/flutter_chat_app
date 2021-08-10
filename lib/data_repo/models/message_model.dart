class MessageModel{
  String? senderId;
  String? senderName;
  String? textMessage;
  

   MessageModel( this.senderId, this.senderName, this.textMessage);

  MessageModel.fromMap(Map<String, dynamic> map) {
    senderId = map['senderId'];
    senderName = map['senderName'];
    textMessage = map['textMessage'];
  }

  // MessageModel.fromSnapshot(DocumentSnapshot snapshot) {
  //   senderId = snapshot['sender_id'];
  //   senderName = snapshot['senderName'];
  //   textMessage = snapshot['textMessage'];
  // }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sender_id': senderId,
      'senderName':senderName,
      'textMessage': textMessage
    };
  }
}