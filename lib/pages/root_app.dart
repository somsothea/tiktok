import 'package:flutter/material.dart';
import 'package:tiktok/pages/home_page.dart';
import 'package:tiktok/pages/inbox.dart';
import 'package:tiktok/theme/colors.dart';
import 'package:tiktok/widgets/tik_tok_icons.dart';
import 'package:tiktok/widgets/upload_icon.dart';
import 'package:tiktok/pages/profile.dart';
import 'package:tiktok/pages/friend_page.dart';
import 'package:image_picker/image_picker.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  final ImagePicker _picker = ImagePicker(); // Create ImagePicker instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: <Widget>[
        HomePage(),
        FriendPage(),
        Center(
          child: Text(
            "Upload",
            style: TextStyle(
                color: black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        InboxPage(),
        ProfilePage(),
      ],
    );
  }

  Widget getFooter() {
    List bottomItems = [
      {"icon": TikTokIcons.home, "label": "Home", "isIcon": true},
      {"icon": TikTokIcons.friends, "label": "Friends", "isIcon": true},
      {"icon": "", "label": "", "isIcon": false},
      {"icon": TikTokIcons.messages, "label": "Inbox", "isIcon": true},
      {"icon": TikTokIcons.profile, "label": "Profile", "isIcon": true}
    ];
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(color: appBgColor),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(bottomItems.length, (index) {
            return bottomItems[index]['isIcon']
                ? InkWell(
                    onTap: () {
                      selectedTab(index);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          bottomItems[index]['icon'],
                          color: white,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Text(
                            bottomItems[index]['label'],
                            style: TextStyle(color: white, fontSize: 10),
                          ),
                        )
                      ],
                    ),
                  )
                : InkWell(
                    onTap: () {
                      openCamera(); // Open camera on upload icon click
                    },
                    child: UploadIcon());
          }),
        ),
      ),
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }

  // Method to open the camera and pick a video
  Future<void> openCamera() async {
    try {
      // Use ImagePicker to pick a video instead of an image
      final XFile? video = await _picker.pickVideo(source: ImageSource.camera);
      if (video != null) {
        // Do something with the video, like displaying it or uploading it.
        print('Picked video path: ${video.path}');
      }
    } catch (e) {
      print('Error picking video: $e');
    }
  }
}
