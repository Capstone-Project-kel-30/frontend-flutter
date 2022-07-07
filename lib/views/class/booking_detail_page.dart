import 'package:flutter/material.dart';

import '../../models/book_info_model.dart';
import '../../models/user_model.dart';
import '../widgets/payment_button.dart';
import '../widgets/user_info.dart';
import '../widgets/vertical_space.dart';
import 'widgets/booking_id.dart';
import 'widgets/booking_type.dart';
import 'widgets/membership_type.dart';

class BookingDetailPage extends StatefulWidget {
  const BookingDetailPage({
    Key? key,
    required this.bookInfo,
    required this.user,
  }) : super(key: key);

  final BookInfoModel bookInfo;
  final User user;

  @override
  State<BookingDetailPage> createState() => _BookingDetailPageState();
}

class _BookingDetailPageState extends State<BookingDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Booking Details')),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: 50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                BookingId(
                  bookingId:
                      'GYM30-${widget.user.memberType!.toUpperCase()}-${widget.bookInfo.data!.id.toString()}',
                ),
                const VerticalSpace(height: 20),
                BookingType(
                  classTitle: widget.bookInfo.data!.classes!.classname!,
                  classType: widget.bookInfo.data!.classes!.clastype!,
                  classDate: widget.bookInfo.data!.classes!.date!,
                ),
                const VerticalSpace(height: 20),
                UserInfo(
                  isLoading: false,
                  name: widget.user.name!,
                  phone: widget.user.phone!,
                  email: widget.user.email!,
                ),
                const VerticalSpace(height: 20),
                MembershipType(
                  memberType: widget.user.memberType!,
                ),
              ],
            ),
            PaymentButton(
              elevatedButtonText: 'Continue',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
