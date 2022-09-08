import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:tartan/controller/booking_controller.dart';
import 'package:tartan/model/booking.dart';
import 'package:tartan/utils/colours.dart';
import 'package:tartan/utils/text_widget.dart';

class RequestList extends StatelessWidget {
  RequestList(
      {Key? key, required this.booking, required this.bookingController})
      : super(key: key);
  Booking booking;
  BookingController bookingController;
  @override
  Widget build(BuildContext context) {
    String dateFormated =
        DateFormat("yyyy-MM-dd").format(booking.bookingDate).toString();
    String twelveHours = DateFormat.jm().format(booking.bookingDate).toString();

    return Slidable(
      groupTag: '0',
      key: const ValueKey(0),
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),
        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            spacing: 10,
            flex: 5,
            autoClose: true,
            onPressed: acceptBooking,
            backgroundColor: Colors.greenAccent,
            foregroundColor: Colors.white,
            icon: Iconsax.save_2,
            label: 'قبول',
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            spacing: 10,
            autoClose: true,
            flex: 5,
            onPressed: denyBooking,
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            icon: Iconsax.save_remove,
            label: 'حذف',
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Colurs.white, borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          title: Textsax(
              text: booking.user.fullName,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colurs.green),
          subtitle: Row(
            children: [
              Textsax(
                  text: twelveHours, fontSize: 15, fontWeight: FontWeight.bold),
              Textsax(
                  text: dateFormated,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ],
          ),
          leading:
              Textsax(text: booking.bookingStatus.bookingStatus, fontSize: 13),
          trailing: booking.bookingStatus.isAvail
              ? Textsax(text: 'متوفر', fontSize: 13)
              : Textsax(text: 'غير متوفر', fontSize: 13),
        ),
      ),
    );
  }

  void acceptBooking(BuildContext context) {
    bookingController.bookingStatus(
        booking.bookingStatus.id, 'الحجز مقبول', true, false);
  }

  void denyBooking(BuildContext context) {
    bookingController.bookingStatus(
        booking.bookingStatus.id, 'الحجز مرفوض', false, true);
  }
}
