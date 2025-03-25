import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/update_profile_screen.dart';

class TMAppBar extends StatelessWidget implements PreferredSize {
  const TMAppBar({
    super.key, this.profile,
  });
  final bool? profile;

  @override
  Widget build(BuildContext context) {
    TextTheme text = Theme.of(context).textTheme;
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      title: GestureDetector(
        onTap: (){
          if(profile==true){
            return;
          }
          Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateProfileScreen(),),);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Siam Bhuiyan',
                      style: text.bodyLarge?.copyWith(
                        color: Colors.white,
                      )),
                  Text(
                    'asadsiam588@gmail.com',
                    style: text.bodySmall?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.logout,
              size: 30,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}
