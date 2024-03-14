import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gap/gap.dart';
import 'package:zoo/services/pages/reuseable/auth/authButton.dart';

class PrivacyPage extends StatefulWidget {
  @override
  _PrivacyPageState createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _newPassword = '';
  String _currentPassword = '';
  String _newName = '';
  String _newAvatarUrl = '';

  String _getName() {
    User? user = _auth.currentUser;
    if (user != null) {
      if (user.displayName == null) {
        return "No name";
      } else {
        return user.displayName!;
      }
    }
    return '';
  }

  String _getAvatar() {
    User? user = _auth.currentUser;
    if (user != null) {
      if (user.photoURL == null) {
        return "https://cdn.tuoitre.vn/zoom/480_300/2022/4/20/photo-1-1650424191062639501281-crop-1650424241729438626691.jpg";
      } else {
        return user.photoURL!;
      }
    }
    return 'https://cdn.tuoitre.vn/zoom/480_300/2022/4/20/photo-1-1650424191062639501281-crop-1650424241729438626691.jpg';
  }

  Future<void> _changePassword() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        AuthCredential credential = EmailAuthProvider.credential(
          email: user.email!,
          password: _currentPassword,
        );
        await user.reauthenticateWithCredential(credential);

        await user.updatePassword(_newPassword);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Password changed successfully')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to change password: $e')),
      );
    }
  }

  Future<void> _changeName() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.updateDisplayName(_newName);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Name changed successfully')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to change name: $e')),
      );
    }
  }

  Future<void> _changeAvatar() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.updatePhotoURL(_newAvatarUrl);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Avatar changed successfully')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to change name: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Current Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your current password';
                    }
                    return null;
                  },
                  onChanged: (String value) {
                    setState(() {
                      _currentPassword = value;
                    });
                  },
                ),
                const Gap(20),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'New Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a new password';
                    }
                    return null;
                  },
                  onChanged: (String value) {
                    setState(() {
                      _newPassword = value;
                    });
                  },
                ),
                const Gap(20),
                AuthButton(
                  buttonText: 'Change Password',
                  fun: () {
                    if (_formKey.currentState!.validate()) {
                      _changePassword();
                    }
                  },
                ),
                const Gap(50),
                TextFormField(
                  initialValue: _getName(),
                  decoration: const InputDecoration(
                    labelText: 'New Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a new name';
                    }
                    return null;
                  },
                  onChanged: (String value) {
                    setState(() {
                      _newName = value;
                    });
                  },
                ),
                const Gap(20),
                AuthButton(
                  buttonText: 'Change Name',
                  fun: () {
                    _changeName();
                  },
                ),
                const Gap(50),
                TextFormField(
                  initialValue: _getAvatar(),
                  decoration: const InputDecoration(
                    labelText: 'New Avatar Url',
                    border: OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a new avatar url';
                    }
                    return null;
                  },
                  onChanged: (String value) {
                    setState(() {
                      _newAvatarUrl = value;
                    });
                  },
                ),
                const Gap(20),
                AuthButton(
                  buttonText: 'Change Avatar Url',
                  fun: () {
                    _changeAvatar();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
