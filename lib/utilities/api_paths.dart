class AppPath {
  static const String product = 'product';
  static String user(String uid) => 'users/${uid}';
  static String addToCart(String uid, String caid) =>
      'users/${uid}/cart/${caid}';
  static String mycart(String uid) => 'users/${uid}/cart';
}
