import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gym_app/%20extensions/ext.dart';
import 'package:gym_app/ViewModels/MoneyRequest/MoneyRequestVm.dart';
import 'package:gym_app/ViewModels/PlanTypeLog/PlanTypeLogVm.dart';
import 'package:gym_app/ViewModels/SubscriptionTypeInvoice/SubscriptionTypeInvoiceListVm.dart';
import 'package:gym_app/ViewModels/Transaction/TransactionVm.dart';
import 'package:gym_app/ViewModels/WalletLog/WalletLogVm.dart';
import 'package:gym_app/blocs/PlanType/bloc/get_plans_by_sort_bloc.dart';
import 'package:gym_app/blocs/WalletLog/bloc/get_all_deposit_bloc.dart';
import 'package:gym_app/blocs/WalletLog/bloc/get_all_withraw_bloc.dart';
import 'package:gym_app/blocs/WalletLog/bloc/get_transfer_other_wallet_bloc.dart';
import 'package:gym_app/blocs/WalletLog/bloc/get_transfer_to_card_bank_bloc.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/myWaiting.dart';
import 'package:gym_app/components/no_data.dart';
import 'package:gym_app/screen/list_barnameha/list_barnameha.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TurnoverPage extends StatefulWidget {
  const TurnoverPage({Key? key}) : super(key: key);
  static const routeName = '/turnoverPage';

  @override
  _TurnoverPageState createState() => _TurnoverPageState();
}

class _TurnoverPageState extends State<TurnoverPage>
    with SingleTickerProviderStateMixin {
  bool onClick = false;

  int _selectedTab = 1;
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 4, vsync: this);
    _pageController = PageController(initialPage: 0, keepPage: true);
    _exerciseScrollController = ScrollController()..addListener(_listener);
    _dietScrollController = ScrollController()..addListener(_listenerDiet);
  }

  late ScrollController _exerciseScrollController;
  late ScrollController _dietScrollController;
  late PageController _pageController;

  _listener() {
    if (_exerciseScrollController.position.pixels ==
        _exerciseScrollController.position.maxScrollExtent) {
      BlocProvider.of<GetAllDepositBloc>(context)
        ..add(GetAllDepositLoadedEvent(10, 1));
    }
  }

  _listenerDiet() {
    if (_dietScrollController.position.pixels ==
        _dietScrollController.position.maxScrollExtent) {
      BlocProvider.of<GetAllDepositBloc>(context)
        ..add(GetAllDepositLoadedEvent(11, 2));
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _exerciseScrollController.dispose();
    _dietScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        toolbarHeight: Get.height * 0.08,
        actions: [
          Container(
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "گزارش مالی",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Get.height * 0.0225,
                        fontFamily: 'IRANSans',
                        fontWeight: FontWeight.w600),
                    maxLines: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                        "assets/icons/vuesax-linear-arrow-square-left.svg"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Container(
        height: gh(1),
        width: gw(1),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            width: Get.width,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.025, vertical: Get.height * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "گردش مالی",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "IRANSans",
                        fontSize: Get.height * 0.0275),
                  ),
                  SizedBox(
                    height: Get.height * 0.035,
                  ),
                  Container(
                      width: gw(1),
                      height: 45,
                      child: TabBar(
                        labelColor: Colors.blue,
                        controller: _tabController,
                        tabs: [
                          Tab(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedTab = 1;
                                });
                                BlocProvider.of<GetAllDepositBloc>(context).add(
                                    GetAllDepositLoadingEvent(
                                        pageNumber: 2, pageSize: 11));
                              },
                              child: AnimatedContainer(
                                duration: Duration(seconds: 1),
                                height: gh(0.25),
                                width: gw(0.3),
                                decoration: BoxDecoration(
                                    color: _selectedTab == 1
                                        ? Colors.grey[300]
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    "واریز ها",
                                    style: TextStyle(
                                        color: _selectedTab == 1
                                            ? Colors.black
                                            : Colors.grey[400],
                                        fontSize: gh(0.0225)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Tab(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedTab = 2;
                                });
                                BlocProvider.of<GetAllWithdrawalBloc>(context)
                                    .add(GetAllWithdrawalLoadingEvent(
                                        pageNumber: 1, pageSize: 10));
                              },
                              child: AnimatedContainer(
                                duration: Duration(seconds: 1),
                                height: gh(0.25),
                                width: gw(0.3),
                                decoration: BoxDecoration(
                                    color: _selectedTab == 2
                                        ? Colors.grey[300]
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    "برداشت ها",
                                    style: TextStyle(
                                        color: _selectedTab == 2
                                            ? Colors.black
                                            : Colors.grey[400],
                                        fontSize: gh(0.0225)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Tab(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedTab = 3;
                                });
                              },
                              child: AnimatedContainer(
                                duration: Duration(seconds: 1),
                                height: gh(0.25),
                                width: gw(0.6),
                                decoration: BoxDecoration(
                                    color: _selectedTab == 3
                                        ? Colors.grey[300]
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    "انتقال به کیف پول دیگران",
                                    style: TextStyle(
                                        color: _selectedTab == 3
                                            ? Colors.black
                                            : Colors.grey[400],
                                        fontSize: gh(0.0225)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Tab(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedTab = 4;
                                });
                              },
                              child: AnimatedContainer(
                                duration: Duration(seconds: 1),
                                height: gh(0.25),
                                width: gw(0.5),
                                decoration: BoxDecoration(
                                    color: _selectedTab == 4
                                        ? Colors.grey[300]
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    "انتقال به حساب بانکی",
                                    style: TextStyle(
                                        color: _selectedTab == 4
                                            ? Colors.black
                                            : Colors.grey[400],
                                        fontSize: gh(0.0225)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                        isScrollable: true,
                        indicatorColor: Colors.transparent,
                        indicatorSize: TabBarIndicatorSize.label,
                        unselectedLabelColor: Colors.black,
                      )),
                  SizedBox(
                    height: Get.height * 0.035,
                  ),
                  _selectedTab == 1
                      ? BlocBuilder<GetAllDepositBloc, GetAllDepositState>(
                          builder: (context, state) => AnimatedSwitcher(
                            duration: Duration(milliseconds: 1500),
                            switchInCurve: Curves.easeIn,
                            child: state is GetAllDepositLoadingState
                                ? Center(child: MyWaiting())
                                : state is GetAllDepositLoadedState &&
                                        state.page_moneyRequestVm != null &&
                                        state.page_moneyRequestVm!.items !=
                                            null &&
                                        state.page_moneyRequestVm!.items!
                                            .isNotEmpty
                                    ? ListView.builder(
                                        controller: _selectedTab == 0
                                            ? _exerciseScrollController
                                            : _dietScrollController,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          if (index <
                                              state.page_moneyRequestVm!.items!
                                                  .length)
                                            return ItemLoadedFirst(
                                                moneyRequestVm: state
                                                    .page_moneyRequestVm!
                                                    .items![index]);
                                          else
                                            return MyWaiting();
                                        },
                                        itemCount:
                                            state.page_moneyRequestVm!.hasNext!
                                                ? state.page_moneyRequestVm!
                                                        .items!.length +
                                                    1
                                                : state.page_moneyRequestVm!
                                                    .items!.length,
                                      )
                                    : state is GetAllDepositLoadedState &&
                                            (state.page_moneyRequestVm ==
                                                    null ||
                                                state.page_moneyRequestVm!
                                                        .items ==
                                                    null ||
                                                state.page_moneyRequestVm!
                                                    .items!.isEmpty)
                                        ? NoData()
                                        : Container(),
                          ),
                        )
                      : _selectedTab == 2
                          ? BlocBuilder<GetAllWithdrawalBloc,
                              GetAllWithdrawalState>(
                              builder: (context, state) => AnimatedSwitcher(
                                duration: Duration(milliseconds: 1500),
                                switchInCurve: Curves.easeIn,
                                child: state is GetAllWithdrawalLoadingState
                                    ? Center(child: MyWaiting())
                                    : state is GetAllWithdrawalLoadedState &&
                                            state.page_moneyRequestVm != null &&
                                            state.page_moneyRequestVm!.items !=
                                                null &&
                                            state.page_moneyRequestVm!.items!
                                                .isNotEmpty
                                        ? ListView.builder(
                                            controller: _selectedTab == 0
                                                ? _exerciseScrollController
                                                : _dietScrollController,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              if (index <
                                                  state.page_moneyRequestVm!
                                                      .items!.length)
                                                return ItemLoadedFirst(
                                                    moneyRequestVm: state
                                                        .page_moneyRequestVm!
                                                        .items![index]);
                                              else
                                                return MyWaiting();
                                            },
                                            itemCount: state
                                                    .page_moneyRequestVm!
                                                    .hasNext!
                                                ? state.page_moneyRequestVm!
                                                        .items!.length +
                                                    1
                                                : state.page_moneyRequestVm!
                                                    .items!.length,
                                          )
                                        : state is GetAllWithdrawalLoadedState &&
                                                (state.page_moneyRequestVm ==
                                                        null ||
                                                    state.page_moneyRequestVm!
                                                            .items ==
                                                        null ||
                                                    state.page_moneyRequestVm!
                                                        .items!.isEmpty)
                                            ? NoData()
                                            : Container(),
                              ),
                            )
                          : _selectedTab == 3
                              ? BlocBuilder<GetTransferToOthersWalletsBloc,
                                  GetTransferToOthersWalletsState>(
                                  builder: (context, state) => AnimatedSwitcher(
                                    duration: Duration(milliseconds: 1500),
                                    switchInCurve: Curves.easeIn,
                                    child: state
                                            is GetTransferToOthersWalletsLoadingState
                                        ? Center(child: MyWaiting())
                                        : state is GetTransferToOthersWalletsLoadedState &&
                                                state.page_transactionVm !=
                                                    null &&
                                                state.page_transactionVm!
                                                        .items !=
                                                    null &&
                                                state.page_transactionVm!.items!
                                                    .isNotEmpty
                                            ? ListView.builder(
                                                controller: _selectedTab == 0
                                                    ? _exerciseScrollController
                                                    : _dietScrollController,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemBuilder: (context, index) {
                                                  if (index <
                                                      state.page_transactionVm!
                                                          .items!.length)
                                                    return ItemLoadedTwo(
                                                        transactionVm: state
                                                            .page_transactionVm!
                                                            .items![index]);
                                                  else
                                                    return MyWaiting();
                                                },
                                                itemCount: state
                                                        .page_transactionVm!
                                                        .hasNext!
                                                    ? state.page_transactionVm!
                                                            .items!.length +
                                                        1
                                                    : state.page_transactionVm!
                                                        .items!.length,
                                              )
                                            : state is GetTransferToOthersWalletsLoadedState &&
                                                    (state.page_transactionVm == null ||
                                                        state.page_transactionVm!
                                                                .items ==
                                                            null ||
                                                        state
                                                            .page_transactionVm!
                                                            .items!
                                                            .isEmpty)
                                                ? NoData()
                                                : Container(),
                                  ),
                                )
                              : _selectedTab == 4
                                  ? BlocBuilder<GetTransferToCardBankBloc,
                                      GetTransferToCardBankState>(
                                      builder: (context, state) =>
                                          AnimatedSwitcher(
                                        duration: Duration(milliseconds: 1500),
                                        switchInCurve: Curves.easeIn,
                                        child: state
                                                is GetTransferToCardBankLoadingState
                                            ? Center(child: MyWaiting())
                                            : state is GetTransferToCardBankLoadedState &&
                                                    state.page_moneyRequestVm !=
                                                        null &&
                                                    state.page_moneyRequestVm!
                                                            .items !=
                                                        null &&
                                                    state.page_moneyRequestVm!
                                                        .items!.isNotEmpty
                                                ? ListView.builder(
                                                    controller: _selectedTab ==
                                                            0
                                                        ? _exerciseScrollController
                                                        : _dietScrollController,
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    itemBuilder:
                                                        (context, index) {
                                                      if (index <
                                                          state
                                                              .page_moneyRequestVm!
                                                              .items!
                                                              .length)
                                                        return ItemLoadedLast(
                                                            moneyRequestVm: state
                                                                .page_moneyRequestVm!
                                                                .items![index]);
                                                      else
                                                        return MyWaiting();
                                                    },
                                                    itemCount: state
                                                            .page_moneyRequestVm!
                                                            .hasNext!
                                                        ? state.page_moneyRequestVm!
                                                                .items!.length +
                                                            1
                                                        : state
                                                            .page_moneyRequestVm!
                                                            .items!
                                                            .length,
                                                  )
                                                : state is GetTransferToCardBankLoadedState &&
                                                        (state.page_moneyRequestVm == null ||
                                                            state.page_moneyRequestVm!
                                                                    .items ==
                                                                null ||
                                                            state
                                                                .page_moneyRequestVm!
                                                                .items!
                                                                .isEmpty)
                                                    ? NoData()
                                                    : Container(),
                                      ),
                                    )
                                  : Container()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ItemDietary extends StatelessWidget {
  const ItemDietary(
      {Key? key,
      required this.sizeScreen,
      required this.planTypeLogvm,
      required this.subscriptionTypeInvoiceListVm})
      : super(key: key);

  final Size sizeScreen;
  final SubscriptionTypeInvoiceListVm subscriptionTypeInvoiceListVm;
  final PlanTypeLogvm planTypeLogvm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: DottedBorder(
        borderType: BorderType.RRect,
        color: parseColor('#CCCCCC'),
        dashPattern: [5],
        radius: Radius.circular(12),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      right:
                          BorderSide(color: parseColor('#00B4D8'), width: 3))),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            subscriptionTypeInvoiceListVm.subscriptionTypeTitle
                                .toString(),
                            style: TextStyle(color: parseColor('#0077B6')),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            subscriptionTypeInvoiceListVm
                                .subscriptionTypeDescription
                                .toString(),
                          ),
                          subscriptionTypeInvoiceListVm
                                  .subscriptionTypeTitle!.isNotEmpty
                              ? Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(subscriptionTypeInvoiceListVm
                                        .subscriptionTypeTitle
                                        .toString()),
                                  ],
                                )
                              : SizedBox()
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(subscriptionTypeInvoiceListVm.nCreationDate
                              .toString()),
                          subscriptionTypeInvoiceListVm.nTotalPrice!.isNotEmpty
                              ? Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                        "${subscriptionTypeInvoiceListVm.nTotalPrice.toString()} تومان "),
                                  ],
                                )
                              : SizedBox()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

class ItemLoadedFirst extends StatelessWidget {
  const ItemLoadedFirst({Key? key, required this.moneyRequestVm})
      : super(key: key);
  final MoneyRequestVm moneyRequestVm;

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: DottedBorder(
        borderType: BorderType.RRect,
        color: parseColor('#CCCCCC'),
        dashPattern: [5],
        radius: Radius.circular(12),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      right:
                          BorderSide(color: parseColor('#00B4D8'), width: 3))),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "مقدار:",
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("${moneyRequestVm.nDeposit}")
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "روش عملیات:",
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("${moneyRequestVm.nPaymentType}")
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "وضعیت:",
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${moneyRequestVm.nStatus}",
                                style: TextStyle(
                                    color: moneyRequestVm.nStatus ==
                                            "در حال انتظار"
                                        ? Colors.orangeAccent
                                        : Colors.blueAccent),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "شماره رسید:",
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("${moneyRequestVm.trackingCode}")
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                " تاریخ و ساعت:",
                                style: TextStyle(color: Colors.black),
                              ),
                              Spacer(),
                              Text("${moneyRequestVm.nCreationDate}")
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

class ItemLoadedTwo extends StatelessWidget {
  const ItemLoadedTwo({Key? key, required this.transactionVm})
      : super(key: key);
  final TransactionVm transactionVm;

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: DottedBorder(
        borderType: BorderType.RRect,
        color: parseColor('#CCCCCC'),
        dashPattern: [5],
        radius: Radius.circular(12),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      right:
                          BorderSide(color: parseColor('#00B4D8'), width: 3))),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "کاربر:",
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("${transactionVm.userId}")
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                " سمت:",
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("-")
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "مقدار:",
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("${transactionVm.nAmount}")
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                " تاریخ و ساعت:",
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("${transactionVm.nCreationDate}")
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

class ItemLoadedLast extends StatelessWidget {
  const ItemLoadedLast({Key? key, required this.moneyRequestVm})
      : super(key: key);
  final MoneyRequestVm moneyRequestVm;

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: DottedBorder(
        borderType: BorderType.RRect,
        color: parseColor('#CCCCCC'),
        dashPattern: [5],
        radius: Radius.circular(12),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      right:
                          BorderSide(color: parseColor('#00B4D8'), width: 3))),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "کاربر:",
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("${moneyRequestVm.userId}")
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                " سمت:",
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("-")
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "مقدار:",
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("${moneyRequestVm.nWithdraw}")
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                " تاریخ و ساعت:",
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("${moneyRequestVm.nCreationDate}")
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
