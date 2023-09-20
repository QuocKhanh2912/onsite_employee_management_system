class UserModal {
  final int userId;
  String userName;
  String role;

  UserModal({required this.userId, required this.userName, required this.role});

  static UserModal nahin = UserModal(
      userId: 123456, userName: 'Faius Mojumder Nahin', role: 'UI/UX Designer');
  static UserModal sharek =
      UserModal(userId: 123456, userName: 'Md. Sharek', role: 'UI/UX Designer');
  static UserModal milon = UserModal(
      userId: 123456, userName: 'Istiyak Milon', role: 'UI/UX Designer');
  static UserModal islam = UserModal(
      userId: 123456, userName: 'Md. Rakibul Islam', role: 'UI/UX Designer');
  static UserModal sorif =
      UserModal(userId: 123456, userName: 'Md. Sorif', role: 'UI/UX Designer');
  static UserModal mobussharIslam = UserModal(
      userId: 123456, userName: 'Md. Mobusshar Islam', role: 'UI/UX Designer');
  static UserModal ratul =
      UserModal(userId: 123456, userName: 'Md. Ratul', role: 'UI/UX Designer');
  //List<UserModal> userMockData = [nahin,sharek,milon,islam,sorif,mobussharIslam,ratul];
}
