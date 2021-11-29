import 'package:flutter/material.dart';
import 'package:parkinglot/models/parkinglot_item.dart';
import 'package:parkinglot/pages/datetime_selection.dart';
import 'package:parkinglot/widget/navigation_bar.dart';
import '../models/reservation_item.dart';
import '../util/colors.dart';

class CheckReservation extends StatefulWidget {
  final userId;
  CheckReservation({@required this.userId}) : super();

  @override
  State<CheckReservation> createState() => _CheckReservationState();
}

class _CheckReservationState extends State<CheckReservation> {
  List<ReservationItem> ReservationList = [
    ReservationItem(
        ParkingLotItem(
            '대한극장주차장1', '서울 중구 필동 2가', '02-1234-5678', 30, 800, 30, true),
        '날짜',
        '시작시간',
        '종료시간',
        '결제금액',
        false),
    ReservationItem(
        ParkingLotItem(
            '대한극장주차장1', '서울 중구 필동 2가', '02-1234-5678', 30, 800, 30, true),
        '날짜',
        '시작시간',
        '종료시간',
        '결제금액',
        false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('님의 예약 내역 확인',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: DefaultTabController(
          length: 2,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
                child: TabBar(
              indicatorColor: Colors.black54,
              indicatorWeight: 4,
              //밑줄 길이
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black54,
              tabs: [
                Tab(text: '과거 예약 내역'),
                Tab(text: '현재 예약 내역'),
              ],
            )),
            Container(
              height: 530, //height of TabBarView
              decoration: BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.grey, width: 0.5))),
              child: TabBarView(
                children: <Widget>[
                  Container(
                    // 과거 예약 내역
                    child: Center(
                        child: ListView.builder(
                      itemCount: ReservationList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 1.0, horizontal: 1.0),
                            child: Card(
                              child: ListTile(
                                onTap: () {},
                                subtitle: Column(children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                ReservationList[index]
                                                    .parkingLotItem
                                                    .name,
                                                style: TextStyle(
                                                    fontSize: 23,
                                                    color: Colors.black87,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            SizedBox(height: 5),
                                            Text(ReservationList[index]
                                                .parkingLotItem
                                                .address),
                                            Text(ReservationList[index]
                                                .parkingLotItem
                                                .telephone),
                                            Text(ReservationList[index]
                                                .start_time),
                                            Text(ReservationList[index]
                                                .end_time),
                                            Text(ReservationList[index]
                                                .total_fee),
                                          ]),
                                      SizedBox(height: 20),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                ]),
                                // --- 이미지 넣기 ---
                              ),
                            ));
                      },
                    )),
                  ),
                  Container(
                    // 현재 예약 내역
                    child: Center(
                        child: ListView.builder(
                      itemCount: ReservationList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 1.0, horizontal: 1.0),
                            child: Card(
                              child: ListTile(
                                onTap: () {},
                                subtitle: Column(children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                ReservationList[index]
                                                    .parkingLotItem
                                                    .name,
                                                style: TextStyle(
                                                    fontSize: 23,
                                                    color: Colors.black87,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            SizedBox(height: 5),
                                            Text(ReservationList[index]
                                                .parkingLotItem
                                                .address),
                                            Text(ReservationList[index]
                                                .parkingLotItem
                                                .telephone),
                                            Text(ReservationList[index].date),
                                            Text(ReservationList[index]
                                                .start_time),
                                            Text(ReservationList[index]
                                                .end_time),
                                            Text(ReservationList[index]
                                                .total_fee),
                                          ]),
                                      SizedBox(height: 20),
                                      SizedBox(width: 25),
                                      IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {},
                                        icon: Icon(Icons.close),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  TextButton(
                                    // onPressed: () {
                                    //   Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(builder: (context) => FixProfileCKPW()
                                    //     )
                                    //   );
                                    // },
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DateTimeSelection(
                                                      parkingLotItem:
                                                          ReservationList[index]
                                                              .parkingLotItem)));
                                    },
                                    style: TextButton.styleFrom(
                                        backgroundColor: blue,
                                        minimumSize: Size(350, 20)),
                                    child: const Text('수정하기',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ]),
                                // --- 이미지 넣기 ---
                              ),
                            ));
                      },
                    )),
                  ),
                ],
              ),
            ),
          ])),
      bottomNavigationBar: NaviBarButtons(MediaQuery.of(context).size, context),
    );
  }
}
