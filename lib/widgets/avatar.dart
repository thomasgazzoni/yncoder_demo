import 'package:flutter/material.dart';

class AuthorAvatar extends StatelessWidget {
  final String url;
  final String fullname;

  AuthorAvatar({Key key, @required this.url, this.fullname}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
        size: Size.square(50),
        child: ClipPath(
          clipper: HexagonalClipper(),
          child: Image.network(this.url),
        ));
  }
}

class HexagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var oneThirdHeight = size.height / 4.0;
    final path = Path()
      ..lineTo(0.0, oneThirdHeight)
      ..lineTo(0.0, oneThirdHeight * 3)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(size.width, oneThirdHeight * 3)
      ..lineTo(size.width, oneThirdHeight)
      ..lineTo(size.width / 2, 0.0)
      ..lineTo(0.0, oneThirdHeight)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
