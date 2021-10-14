import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym_app/ViewModels/ChatMessage/ChatMessageVm.dart';
import 'package:gym_app/blocs/RoomChat/bloc/get_all_room_chat_bloc.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/myWaiting.dart';
import 'package:gym_app/components/my_Image.dart';
import 'package:gym_app/components/no_data.dart';
import 'package:gym_app/extensions/ext.dart';

import 'chat_page.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({Key? key}) : super(key: key);
  static const routeName = '/chatCategory';

  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  late ScrollController _chatListScrollController;
  @override
  void initState() {
    _chatListScrollController = ScrollController()..addListener(_listener);
    super.initState();
  }

  _listener() {
    if (_chatListScrollController.position.pixels ==
        _chatListScrollController.position.maxScrollExtent) {
      BlocProvider.of<GetAllRoomChatBloc>(context)
        ..add(GetAllRoomChatLoadedEvent());
    }
  }

  var itemsList = [
    {
      "name": "علی کریمی",
      "time": "18:44",
      "last_message": "سلام",
      "from": "user",
      "avatar":
          "https://s4.uupload.ir/files/half-profile-image-handsome-young-caucasian-man-with-good-skin-brown-eyes-black-stylish-hair-stubble-posing-isolated-against-blank-wall-looking-front-_erz2.png",
      "new_messages": 1,
      "isRead": true
    },
    {
      "name": "علی صدیقی منش",
      "time": "18:44",
      "last_message": "سلام",
      "from": "me",
      "avatar":
          "https://s4.uupload.ir/files/half-profile-image-handsome-young-caucasian-man-with-good-skin-brown-eyes-black-stylish-hair-stubble-posing-isolated-against-blank-wall-looking-front-_erz2.png",
      "new_messages": 0,
      "isRead": false
    },
    {
      "name": "علی صدیقی منش",
      "time": "18:44",
      "last_message": "سلام",
      "from": "user",
      "avatar":
          "https://s4.uupload.ir/files/half-profile-image-handsome-young-caucasian-man-with-good-skin-brown-eyes-black-stylish-hair-stubble-posing-isolated-against-blank-wall-looking-front-_erz2.png",
      "new_messages": 0,
      "isRead": false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'گفتگو ها',
      ),
      floatingActionButton: Ink(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.16),
                  blurRadius: 15,
                  offset: Offset(0.0, 0.0))
            ],
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [parseColor('#00B4D8'), parseColor('#48CAE4')])),
        child: InkWell(
          onTap: () {},
          child: Container(
            width: gw(0.15),
            height: gw(0.15),
            padding: EdgeInsets.all(gw(0.03)),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.16),
                      blurRadius: 15,
                      offset: Offset(0.0, 0.0))
                ],
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [parseColor('#00B4D8'), parseColor('#48CAE4')])),
            child: SvgPicture.asset('assets/icons/floating-icon.svg'),
          ),
        ),
      ),
      body: Container(
        height: gh(1),
        width: gw(1),
        padding: EdgeInsets.symmetric(horizontal: gw(0.05)),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12), topLeft: Radius.circular(12))),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    hintText: 'جستجوی گفتگوها',
                    hintStyle: TextStyle(color: parseColor('#9D9D9D')),
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 30,
                    ),
                    suffixStyle: const TextStyle(color: Colors.green)),
              ),
              SizedBox(
                height: 30,
              ),
              BlocBuilder<GetAllRoomChatBloc, GetAllRoomChatState>(
                builder: (context, state) {
                  return AnimatedSwitcher(
                      duration: Duration(seconds: 1),
                      child: state is GetAllRoomChatLoadingState
                          ? MyWaiting()
                          : state is GetAllRoomChatLoadedState &&
                                  state.pageChatMessageVm != null &&
                                  state.pageChatMessageVm!.items != null &&
                                  state.pageChatMessageVm!.items!.isNotEmpty
                              ? ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  controller: _chatListScrollController,
                                  itemBuilder: (context, index) {
                                    if (index <
                                        state.pageChatMessageVm!.items!.length)
                                      return ItemLoadedListChat(
                                        chatMessageVm: state
                                            .pageChatMessageVm!.items![index],
                                      );
                                    else
                                      return MyWaiting();
                                  },
                                  itemCount: state.pageChatMessageVm!.hasNext!
                                      ? state.pageChatMessageVm!.items!.length +
                                          1
                                      : state.pageChatMessageVm!.items!.length,
                                )
                              : state is GetAllRoomChatLoadedState &&
                                      (state.pageChatMessageVm == null ||
                                          state.pageChatMessageVm!.items ==
                                              null ||
                                          state.pageChatMessageVm!.items!
                                              .isEmpty)
                                  ? NoData()
                                  : Container());
                },
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemLoadedListChat extends StatelessWidget {
  ItemLoadedListChat({Key? key, required this.chatMessageVm}) : super(key: key);
  final ChatMessageVm chatMessageVm;

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, ChatPage.routeName,
              arguments: chatMessageVm);
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          width: sizeScreen.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 15,
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: MyImage(
                      url: chatMessageVm.pic,
                    )),
              ),
              Expanded(
                  flex: 85,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    chatMessageVm.titel,
                                    style: TextStyle(
                                        fontSize: kFontSizeText(
                                            sizeScreen, FontSize.title),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  if (int.parse(chatMessageVm.countNotSeen
                                          .toString()) !=
                                      0)
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 7),
                                      child: SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: Center(
                                          child: CircleAvatar(
                                              backgroundColor:
                                                  parseColor('#48CAE4'),
                                              child: Text(
                                                chatMessageVm.countNotSeen
                                                    .toString(),
                                                textDirection:
                                                    TextDirection.ltr,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                        ),
                                      ),
                                    )
                                ],
                              ),
                              Row(
                                children: [
                                  if (chatMessageVm.isMe!)
                                    Text(
                                      "شما : ",
                                      style: TextStyle(
                                          color: parseColor('#8F8F8F'),
                                          fontSize: kFontSizeText(
                                              sizeScreen, FontSize.subTitle)),
                                    ),
                                  Text(
                                    chatMessageVm.textMessage,
                                    style: TextStyle(
                                        color: parseColor('#8F8F8F'),
                                        fontSize: kFontSizeText(
                                            sizeScreen, FontSize.subTitle)),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              if (chatMessageVm.isMe!)
                                if (chatMessageVm.isSee!)
                                  SvgPicture.asset(
                                      'assets/icons/double-tick-icon.svg')
                                else
                                  SvgPicture.asset(
                                      'assets/icons/tick-icon.svg'),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                chatMessageVm.nSeenDateTime,
                                style: TextStyle(
                                    fontSize: kFontSizeText(
                                        sizeScreen, FontSize.normal),
                                    color: parseColor('#8F8F8F')),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
