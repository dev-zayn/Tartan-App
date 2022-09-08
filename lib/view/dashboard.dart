import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tartan/controller/booking_controller.dart';
import 'package:tartan/utils/colours.dart';

import 'widget/dash_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colurs.backgroundColor,
          appBar: AppBar(
            backgroundColor: Colurs.white,
            toolbarHeight: 0,
            elevation: 0,
            bottom: TabBar(
              onTap: (index) {},
              tabs: [
                Tab(
                  child: Text(
                    'المعلقة',
                    style: TextStyle(color: Colurs.green),
                  ),
                ),
                Tab(
                  child: Text(
                    'المقبولة',
                    style: TextStyle(color: Colurs.green),
                  ),
                ),
                Tab(
                  child: Text(
                    'المرفوضة',
                    style: TextStyle(color: Colurs.green),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              GetBuilder<BookingController>(
                  init: BookingController(),
                  builder: (bookingController) {
                    {
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (_context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 7.5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            child: RequestList(
                              booking:
                                  bookingController.fieldBookingsList[index],
                              bookingController: bookingController,
                            ),
                          );
                        },
                        itemCount: bookingController.fieldBookingsList.length,
                      );
                    }
                  }),
              GetBuilder<BookingController>(
                  init: BookingController(),
                  global: true,
                  builder: (bookingController) {
                    {
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (_context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 7.5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            child: RequestList(
                              booking: bookingController
                                  .fieldAcceptedBookingsList[index],
                              bookingController: bookingController,
                            ),
                          );
                        },
                        itemCount:
                            bookingController.fieldAcceptedBookingsList.length,
                      );
                    }
                  }),
              GetBuilder<BookingController>(
                  init: BookingController(),
                  global: true,
                  builder: (bookingController) {
                    {
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (_context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 7.5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            child: RequestList(
                              booking: bookingController
                                  .fieldRejectedBookingsList[index],
                              bookingController: bookingController,
                            ),
                          );
                        },
                        itemCount:
                            bookingController.fieldRejectedBookingsList.length,
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
  //
  // Future<void> refresh() {
  //   return bookingController.getBookings(GetStorage().read('yardID'));
  // }
}
