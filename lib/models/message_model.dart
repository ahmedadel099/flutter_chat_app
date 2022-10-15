class Message {
  final String senderId;
  final String recipientId;
  final String text;
  final DateTime createdAt;

  Message(
      {required this.senderId,
      required this.recipientId,
      required this.text,
      required this.createdAt});

  static  List<Message> messages = [
    Message(
      senderId: '1',
      recipientId: '2',
      text: 'Good Morning ',
      createdAt: DateTime(2022, 08, 01, 10, 10, 10).add(
       const Duration(seconds: 30),
      ),
    ),

    Message(
      senderId: '2',
      recipientId: '1',
      text: 'Good Morning',
      createdAt: DateTime(2022, 08, 01, 11, 10, 10).add(
        const Duration(seconds: 15),
      ),
    ),

    Message(
      senderId: '3',
      recipientId: '1',
      text: 'Good Night',
      createdAt: DateTime(2022, 09, 01, 10, 10, 10).add(
        const Duration(seconds: 55),
      ),
    ),

    Message(
      senderId: '1',
      recipientId: '3',
      text: 'Good Night Bro ',
      createdAt: DateTime(2022, 09, 01, 10, 10, 10).add(
        const Duration(seconds: 55),
      ),
    ),

  ];
}
