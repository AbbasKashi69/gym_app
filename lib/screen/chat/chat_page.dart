import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/custom_switch.dart';
import 'package:gym_app/components/dynamic_appbar.dart';
import 'package:gym_app/extensions/ext.dart';
import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:gym_app/screen/CreateProgramBody/create_program_body_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:file_picker/file_picker.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // For the testing purposes, you should probably use https://pub.dev/packages/uuid
  String randomString() {
    final random = Random.secure();
    final values = List<int>.generate(16, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  List<types.Message> _messages = [];
  final _user = const types.User(id: '06c33e8b-e835-4736-80f4-63f44b66666c');

  void _addMessage(types.CustomMessage message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(message) {
    final customMessage = types.CustomMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: randomString(),
        metadata: message);
    _addMessage(customMessage);
  }

  final _textController = TextEditingController();
  bool showEmoji = false;
  bool showMenu = false;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // FocusScope.of(context).requestFocus(FocusNode());
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: DynamicAppBar(
          height: gh(0.10),
          child: Container(
            width: gw(1),
            height: gh(0.10),
            padding: EdgeInsets.symmetric(horizontal: gw(0.03), vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showMenu = !showMenu;
                    });
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/list-icon.svg',
                        width: 5,
                        height: gh(0.03),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Stack(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: MediaQuery.of(context).size.width > 550
                                ? 30
                                : 20,
                            backgroundImage: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiLA28J7m4Jbacks8ceGZoQC-QgRLqbje9nA&usqp=CAU'),
                          ),
                          Positioned(
                              bottom: 0,
                              left: 0,
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    color: parseColor('#48CAE4'),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.white, width: 2)),
                              ))
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(child: Text("علی کریمی")),
                          Flexible(
                              child: Text(
                            "آنلاین",
                            style: TextStyle(
                                color: parseColor('#00B4D8'), fontSize: 13),
                          ))
                        ],
                      )
                    ],
                  ),
                ),
                GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: SvgPicture.asset(
                      'assets/icons/backIcon.svg',
                      width: MediaQuery.of(context).size.width > 550 ? 40 : 25,
                      height: MediaQuery.of(context).size.width > 550 ? 40 : 25,
                    )
                    // child: Container(),
                    ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  if (showMenu) {
                    setState(() {
                      showMenu = false;
                    });
                  }
                },
                child: Chat(
                  messages: _messages,
                  onSendPressed: (p0) {},
                  user: _user,
                  showUserAvatars: false,
                  showUserNames: true,
                  theme: DefaultChatTheme(
                    backgroundColor: parseColor('#FBFBFB'),
                    primaryColor: Colors.transparent,
                    messageBorderRadius: 0,
                  ),
                  customBottomWidget: Column(
                    children: [
                      Container(
                        width: gw(1),
                        // height: gh(0.07),
                        padding:
                            EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                                top: BorderSide(color: parseColor('#707070')))),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                                'assets/icons/microphone-icon.svg'),
                            Expanded(
                              child: TextField(
                                maxLines: null,
                                controller: _textController,
                                keyboardType: TextInputType.multiline,
                                textInputAction: TextInputAction.send,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintText: 'پیام خود را بنویسید ...',
                                    hintStyle: TextStyle(
                                      color: parseColor('#707070'),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'IRANSans',
                                    ).copyWith(
                                        fontSize: kFontSizeText(
                                            MediaQuery.of(context).size,
                                            FontSize.subTitle))),
                                onSubmitted: (value) {
                                  _handleSendPressed({"text": value});
                                  _textController.clear();
                                },
                              ),
                            ),
                            InkWell(
                                onTap: () async {
                                  FocusScope.of(context).unfocus();
                                  int? number = await showAttachMenu();
                                  if (number != null) {
                                    bool allow;
                                    // number=1 it means we select pick file
                                    if (number == 1) {
                                      allow = await _requestPermission(
                                          Permission.storage);
                                      if (allow) await getFile();
                                    }
                                    // number=2 get image from camera
                                    else if (number == 2) {
                                      allow = await _requestPermission(
                                          Permission.camera);
                                      if (allow)
                                        await getImage(ImageSource.camera);
                                    }

                                    // number=3 get image from gallery
                                    else if (number == 3) {
                                      allow = await _requestPermission(
                                          Permission.storage);
                                      if (allow)
                                        await getImage(ImageSource.gallery);
                                    }
                                  }
                                },
                                child: SvgPicture.asset(
                                    'assets/icons/attach-icon.svg')),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    showEmoji = !showEmoji;
                                  });
                                },
                                child: SvgPicture.asset(
                                  showEmoji
                                      ? 'assets/icons/sticker-black-icon.svg'
                                      : 'assets/icons/sticker-icon.svg',
                                  width: 28,
                                  height: 28,
                                )),
                          ],
                        ),
                      ),
                      AnimatedSizeAndFade(
                          child: showEmoji
                              ? SizedBox(
                                  height: gh(0.35),
                                  width: gw(1),
                                  child: EmojiPicker(
                                    onEmojiSelected: (category, emoji) {
                                      _textController.text += emoji.emoji;
                                    },
                                    onBackspacePressed: () {
                                      if (_textController.text.length > 0) {
                                        _textController.text =
                                            _textController.text.substring(
                                                0,
                                                _textController.text.length -
                                                    1);
                                      }
                                    },
                                    config: Config(
                                        columns: 7,
                                        emojiSizeMax:
                                            32 * (Platform.isIOS ? 1.30 : 1.0),
                                        // Issue: https://github.com/flutter/flutter/issues/28894
                                        verticalSpacing: 0,
                                        horizontalSpacing: 0,
                                        initCategory: Category.RECENT,
                                        bgColor: Color(0xFFF2F2F2),
                                        indicatorColor: Colors.blue,
                                        iconColor: Colors.grey,
                                        progressIndicatorColor: Colors.blue,
                                        showRecentsTab: true,
                                        backspaceColor: Colors.black,
                                        recentsLimit: 28,
                                        noRecentsText: "No",
                                        noRecentsStyle: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.black26),
                                        tabIndicatorAnimDuration:
                                            kTabScrollDuration,
                                        categoryIcons: const CategoryIcons(),
                                        buttonMode: ButtonMode.MATERIAL),
                                  ),
                                )
                              : SizedBox())
                    ],
                  ),
                  customMessageBuilder: (p0) {
                    return Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 40,
                          height: gh(0.05),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiLA28J7m4Jbacks8ceGZoQC-QgRLqbje9nA&usqp=CAU'),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: parseColor('#48CAE4'),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      topLeft: Radius.circular(30),
                                      bottomLeft: Radius.circular(30))),
                              child: Text(
                                p0.metadata!['text'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'IRANSans'),
                              ),
                            ),
                            Text(
                              "18:44",
                              style: TextStyle(
                                  fontSize: 12, color: parseColor('#8F8F8F')),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                  emptyState: Center(
                      child: Text(
                    "هنوز پیامی ثبت نشده است ...",
                    style: TextStyle(color: parseColor('#707070')),
                  )),
                ),
              ),
              AnimatedSizeAndFade(
                sizeDuration: const Duration(milliseconds: 500),
                fadeDuration: const Duration(milliseconds: 500),
                child: showMenu
                    ? SizedBox(
                        width: gw(0.5),
                        height: 150,
                        child: Material(
                          color: Colors.white,
                          elevation: 10,
                          borderRadius: BorderRadius.circular(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    showMenu = false;
                                  });
                                  showDeleteDialog();
                                },
                                borderRadius: BorderRadius.circular(10),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("حذف گفتگو"),
                                      SvgPicture.asset(
                                          'assets/icons/trash2-icon.svg')
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("پروفایل کاربر"),
                                      SvgPicture.asset(
                                          'assets/icons/profile-user-icon.svg')
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      showMenu = false;
                                    });
                                    showAlarmDialog();
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("روشن کردن اعلان"),
                                        SvgPicture.asset(
                                            'assets/icons/linear-notification.svg')
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      )
                    : SizedBox(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future showAttachMenu() async {
    return await showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12), topLeft: Radius.circular(12)),
        ),
        builder: (context) => Container(
            height: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12))),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 60,
                  height: 6,
                  decoration: BoxDecoration(
                      color: parseColor('#E8E8E8'),
                      borderRadius: BorderRadius.circular(20)),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: gw(0.1),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop(1);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/file-icon.svg'),
                            SizedBox(
                              height: 10,
                            ),
                            Text("فایل")
                          ],
                        ),
                      ),
                      SizedBox(
                        width: gw(0.1),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop(2);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/camera-icon.svg'),
                            SizedBox(
                              height: 10,
                            ),
                            Text("دوربین")
                          ],
                        ),
                      ),
                      SizedBox(
                        width: gw(0.1),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop(3);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/gallery-icon.svg',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("گالری")
                          ],
                        ),
                      ),
                      SizedBox(
                        width: gw(0.1),
                      ),
                    ],
                  ),
                )
              ],
            )));
  }

  void showDeleteDialog() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12), topLeft: Radius.circular(12)),
        ),
        builder: (context) => Container(
            height: gh(45),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12))),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 60,
                  height: 6,
                  decoration: BoxDecoration(
                      color: parseColor('#E8E8E8'),
                      borderRadius: BorderRadius.circular(20)),
                ),
                SizedBox(
                  height: 30,
                ),
                SvgPicture.asset('assets/icons/bulk-trash.svg'),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "گفتگو حذف شود؟",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                Text(
                  "در صورت حذف دیگر به پیام ها دسترسی نخواهید داشت!",
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: gw(0.02),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: 50,
                            child: CustomeButton(
                              title: 'بله',
                              onTap: () {
                                Navigator.pop(context);
                              },
                              sizeScreen: MediaQuery.of(context).size,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: gw(0.02),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                              height: 50,
                              child: Material(
                                child: Ink(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(20),
                                          right: Radius.circular(20)),
                                      gradient: LinearGradient(
                                          colors: [
                                            parseColor('#F3F3F3'),
                                            parseColor('#F3F3F3'),
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter)),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    splashColor: Colors.white.withOpacity(0.5),
                                    borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(20),
                                        right: Radius.circular(20)),
                                    child: Container(
                                      height: Get.height * 0.07,
                                      width: Get.width * 0.8,
                                      child: Center(
                                        child: Text(
                                          "خیر",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'IRANSans',
                                          ).copyWith(
                                              fontSize: kFontSizeText(
                                                  MediaQuery.of(context).size,
                                                  FontSize.subTitle),
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        width: gw(0.02),
                      ),
                    ],
                  ),
                )
              ],
            )));
  }

  void showAlarmDialog() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12), topLeft: Radius.circular(12)),
        ),
        builder: (context) => Container(
            height: gh(45),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12))),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 60,
                  height: 6,
                  decoration: BoxDecoration(
                      color: parseColor('#E8E8E8'),
                      borderRadius: BorderRadius.circular(20)),
                ),
                SizedBox(
                  height: 30,
                ),
                SvgPicture.asset('assets/icons/bulk-trash.svg'),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "ارسال اعلان",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "با روشن کردن اعلان ها در صورت دریافت پیام از کاربر به شما اطلاع خواهیم داد",
                  ),
                ),
                CustomSwitch()
              ],
            )));
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }

  Future<void> getImage(ImageSource imageSource) async {
    ImagePicker picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: imageSource);
    if (pickedImage != null) {
      var x = await pickedImage.readAsBytes();
      var result = await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ShowSelectedImage(uintImage: x)));
      if (result != null) {
        // widget.personVm.fileVm =
        //     FileVm(fileName: pickedImage.path, pickFiles: result as Uint8List);
        // setState(() {
        //   _isFromNet = false;
        //   widget.personVm.uint8list = result;
        // });
      }
    }
  }

  Future<void> getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    print('result is $result');

    if (result != null) {
      File file = File(result.files.single.path ?? "");
    } else {
      // User canceled the picker
    }
  }
}

class ShowSelectedImage extends StatelessWidget {
  const ShowSelectedImage({Key? key, required this.uintImage})
      : super(key: key);
  final Uint8List uintImage;

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.arrow_forward_ios))
            ],
          )
        ],
      ),
      body: Container(
        height: sizeScreen.height,
        width: sizeScreen.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: MemoryImage(uintImage), fit: BoxFit.contain)),
      ),
      floatingActionButton: Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          padding: EdgeInsets.only(bottom: 10, right: 40),
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

            onPressed: () {
              Navigator.of(context).pop(uintImage);
            },
            child: Icon(Icons.send),
          ),
        ),
      ),
    );
  }
}
