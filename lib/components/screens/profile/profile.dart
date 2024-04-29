import 'package:flutter/material.dart';
import 'package:gym_app/infraestructure/models/profile_model.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileModel profile = ProfileModel(
      name: 'Alex Ulloa',
      profileURL:
          'https://api.dicebear.com/8.x/adventurer-neutral/png?backgroundColor=b6e3f4&size=300');

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          _ProfileImage(
            profileURL: profile.profileURL,
          ),
          Container(
              transform: Matrix4.translationValues(0, -80, 0),
              child: Text(
                profile.name,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
              ))
        ],
      ),
    ));
  }
}

class _ProfileImage extends StatelessWidget {
  final String profileURL;

  const _ProfileImage({required this.profileURL});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        ClipPath(
            clipper: _ProfileImageClipper(),
            child: SizedBox(
              width: width,
              height: 300,
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(profileURL),
                color: Colors.black87,
                colorBlendMode: BlendMode.overlay,
              ),
            )),
        Container(
          transform: Matrix4.translationValues(0, -100, 0),
          child: CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              profileURL,
              scale: 0.9,
            ),
            foregroundColor: Colors.blue,
          ),
        ),
      ],
    );
  }
}

class _ProfileImageClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double width = size.width;
    double height = size.height;
    double offset = -100.00;
    Path path = Path();

    path.lineTo(0, height + offset);
    path.quadraticBezierTo(width / 2, height, width, height + offset);

    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
