class MockDataUserModal {
  final int userId;
  String userName;
  String role;

  MockDataUserModal({required this.userId, required this.userName, required this.role});

  static MockDataUserModal nahin = MockDataUserModal(
      userId: 123456, userName: 'Faius Mojumder Nahin', role: 'UI/UX Designer');
  static MockDataUserModal sharek =
      MockDataUserModal(userId: 123456, userName: 'Md. Sharek', role: 'UI/UX Designer');
  static MockDataUserModal milon = MockDataUserModal(
      userId: 123456, userName: 'Istiyak Milon', role: 'UI/UX Designer');
  static MockDataUserModal islam = MockDataUserModal(
      userId: 123456, userName: 'Md. Rakibul Islam', role: 'UI/UX Designer');
  static MockDataUserModal sorif =
      MockDataUserModal(userId: 123456, userName: 'Md. Sorif', role: 'UI/UX Designer');
  static MockDataUserModal mobussharIslam = MockDataUserModal(
      userId: 123456, userName: 'Md. Mobusshar Islam', role: 'UI/UX Designer');
  static MockDataUserModal ratul =
      MockDataUserModal(userId: 123456, userName: 'Md. Ratul', role: 'UI/UX Designer');
  static List<MockDataUserModal> userMockData = [nahin,sharek,milon,islam,sorif,mobussharIslam,ratul];
}
