import 'package:clean_arch/feature/user/domain/entity/user.dart';
import 'package:flutter/material.dart';

class UserProfileCard extends StatelessWidget {
  final User user;

  const UserProfileCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 8.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 50,
                  //DUMMY  avatar
                  backgroundImage: NetworkImage(
                    'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png',
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: Text(
                  user.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Center(
                child: Text(
                  '@${user.username}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
              const Divider(height: 32.0),
              ListTile(
                leading: const Icon(Icons.email, color: Colors.purple),
                title: Text(user.email),
              ),
              ListTile(
                leading: const Icon(Icons.phone, color: Colors.purple),
                title: Text(user.phone),
              ),
              ListTile(
                leading: const Icon(Icons.web, color: Colors.purple),
                title: Text(user.website),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
