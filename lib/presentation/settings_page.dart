import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import 'my_widgets/settings_item.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 25.sp),
          Text(
            "Settings",
            style: TextStyle(fontSize: 30.sp),
          ),
          SizedBox(height: 25.sp),
          SettingsItem(
            title: "FAQ",
            onTap: () => Navigator.pushNamed(context, "faqScreen"),
          ),
          const Divider(),
          SettingsItem(
            title: "Terms & Conditions",
            onTap: () => Navigator.pushNamed(context, "termsScreen"),
          ),
          const Divider(),
          SettingsItem(
            title: "Our partners",
            onTap: (){},
          ),
          const Divider(),
          SettingsItem(
            title: "Support",
            onTap: (){},
          ),
          const Divider(),
          SettingsItem(
            title: "Log out",
            onTap: () async {
              await showDialog<bool>(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Do you want to exit the app?'),
                    actionsAlignment: MainAxisAlignment.spaceBetween,
                    actions: [
                      TextButton(
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                        child: const Text('Yes'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: const Text('No'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}