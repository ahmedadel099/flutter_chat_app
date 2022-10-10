class User {
  final String name;
  final String id;
  final String surname;
  final String imageUrl;

  User(
      {required this.name,
      required this.id,
      required this.surname,
      required this.imageUrl});

  static List<User> users = [
    User(
        id: '1',
        name: 'Ahmed',
        surname: 'Adel',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/zmap-demo-f9e6e.appspot.com/o/facebook%2Fdownload.jpg?alt=media&token=714d5c4b-0f97-4a89-ad1a-061f3d8e146c'),
    User(
        name: 'Mo',
        id: '2',
        surname: 'Mokey',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/zmap-demo-f9e6e.appspot.com/o/facebook%2FFLGH5qFXMAcEGxl.png?alt=media&token=ccb29f33-0a83-47b6-88f0-d1974da48945'),
    User(
        name: 'Abdullah',
        id: '3',
        surname: 'Dadi',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/zmap-demo-f9e6e.appspot.com/o/facebook%2Fdownload%20(1).jpg?alt=media&token=88c6f6ba-ec00-4e0d-8528-2e37e2b8b03d'),
  ];
}
