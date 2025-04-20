import 'package:flutter/material.dart';
import 'package:task_manager/data/models/user_model.dart';
import 'package:task_manager/ui/controller/auth_controller.dart';
import 'package:task_manager/ui/widgets/tm_app_bar.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  bool _isVisible = true;
  final ImagePicker picker = ImagePicker();
  XFile? image;
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _firstNameTextEditingController =
      TextEditingController();
  final TextEditingController _lastNameTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final TextEditingController _mobileTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    UserModel userModel = AuthController.userModel!;
    _emailTextEditingController.text = userModel.email;
    _lastNameTextEditingController.text = userModel.lastName;
    _firstNameTextEditingController.text = userModel.firstName;
    _mobileTextEditingController.text = userModel.mobile;
    super.initState();
  }

  @override
  void dispose() {
    _emailTextEditingController.dispose();
    _mobileTextEditingController.dispose();
    _firstNameTextEditingController.dispose();
    _lastNameTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(
        profile: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Update Profile',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 35,
                      ),
                ),
                SizedBox(
                  height: 20,
                ),
                _buildProfilePicTakerWidget(context),
                //for email input box
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  enabled: false,
                  controller: _emailTextEditingController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(hintText: 'Email'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your first name';
                    }
                  },
                  controller: _firstNameTextEditingController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'First name',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your last name';
                    }
                  },
                  controller: _lastNameTextEditingController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'Last name',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (String? value) {
                    String mobile = value?.trim() ?? '';
                    final RegExp bdPhoneRegex =
                        RegExp(r'^(?:\+8801|01)[3-9]\d{8}$');
                    if (bdPhoneRegex.hasMatch(mobile) == false) {
                      return 'please enter a valid mobile';
                    }
                    return null;
                  },
                  controller: _mobileTextEditingController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: 'Phone',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _passwordTextEditingController,
                  obscureText: _isVisible,
                  // validator: (String? value) {
                  //   final RegExp passwordRegex =
                  //       RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$');
                  //
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter your password';
                  //   } else if (!passwordRegex.hasMatch(value)) {
                  //     return 'Password must be at least 6 characters and include letters and numbers';
                  //   }
                  //
                  //   return null;
                  // },
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isVisible == false
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.greenAccent,
                      ),
                      onPressed: () {
                        setState(() {
                          _isVisible = !_isVisible;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: _onTapSubmitButton,
                  child: Icon(
                    Icons.arrow_circle_right_outlined,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//extracted method to build the profile picture upload widget
  Widget _buildProfilePicTakerWidget(BuildContext context) {
    return GestureDetector(
      onTap: _onTapPhotoPicker,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5)),
              ),
              child: Text(
                "Photos",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              image?.name ?? 'Select a profile image',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onTapPhotoPicker() async {
    // Pick an image.
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);
    // Capture a photo.
    if (pickedImage != null) {
      image = pickedImage;
      setState(() {});
    }
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      image = photo;
      setState(() {});
    }
  }

  void _onTapSubmitButton() {
    if(_formKey.currentState!.validate()){
      //update
    }
  }
}
