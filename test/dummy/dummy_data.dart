import 'package:workout_zone/models/book_info_model.dart';
import 'package:workout_zone/models/class_model.dart';
import 'package:workout_zone/models/membership_model.dart';
import 'package:workout_zone/models/membership_payment_model.dart';
import 'package:workout_zone/models/newsletter__model.dart';
import 'package:workout_zone/models/user_model.dart';
import 'package:workout_zone/utils/common/constant.dart';

const name = "test";
const email = "tested@tested.com";
const password = "test1234";
const phone = "081299012399";
const otp = "123456";
const errorMsg = "error";
const userId = 1;
const authorization = 'abcd';
const memberType = 'GOLD';
const membershipId = 1;
final UserModel user = UserModel(
  data: User(
    name: name,
    email: email,
    password: password,
    phone: phone,
    token: authorization,
    memberType: memberType,
    id: userId,
    totp: otp,
  ),
);
final Member member = Member(
  description: 'description',
  duration: 12,
  id: 1,
  price: 900000,
  type: 'GOLD',
);
final MembershipModel membershipModel = MembershipModel(data: [member]);
final MembershipPaymentModel membershipPayment = MembershipPaymentModel(
  data: MembershipPayment(
    user: user.data,
    amount: 900000,
    id: membershipId,
    membership: member,
    snapUrl: 'snapUrl',
  ),
);
final Newsletter newsletter = Newsletter(
  content: 'content',
  date: '22-20-2022',
  id: 1,
  image: 'imgUrl',
  title: 'newsletter title',
);
final NewsletterModel newsletterModel = NewsletterModel(
  data: [newsletter],
);
List<Class> offlineClasses = [
  Class(
    id: 111,
    classname: 'Dummy Offline 2',
    capacity: 20,
    clastype: offlineClass,
    clock: '17:00',
    date: '10-07-2022',
    description: "descriptionDummy",
    duration: 60,
    image: '',
    status: 'Available',
    trainer: 'Trainer',
    userBooked: 20,
  ),
  Class(
    id: 110,
    classname: 'Dummy Offline 1',
    capacity: 20,
    clastype: offlineClass,
    clock: '17:00',
    date: '10-07-2022',
    description: "descriptionDummy",
    duration: 60,
    image: '',
    status: 'Available',
    trainer: 'Trainer',
    userBooked: 20,
  ),
];
List<Class> onlineClasses = [
  Class(
    id: 10,
    classname: 'Dummy Online 2',
    capacity: 20,
    clastype: onlineClass,
    clock: '17:00',
    date: '10-07-2022',
    description: "descriptionDummy",
    duration: 60,
    image: '',
    status: 'Available',
    trainer: 'Trainer',
    userBooked: 20,
  ),
  Class(
    id: 11,
    classname: 'Dummy Online 1',
    capacity: 20,
    clastype: onlineClass,
    clock: '17:00',
    date: '10-07-2022',
    description: "descriptionDummy",
    duration: 60,
    image: '',
    status: 'Available',
    trainer: 'Trainer',
    userBooked: 20,
  ),
];

List<Class> allClass = [
  ...offlineClasses,
  ...onlineClasses,
];
final ClassModel allClassModel = ClassModel(
  data: allClass,
);
final ClassModel offlineClassModel = ClassModel(
  data: offlineClasses,
);
final ClassModel onlineClassModel = ClassModel(
  data: onlineClasses,
);
final BookInfoModel bookInfo = BookInfoModel(
  data: BookData(
    classes: offlineClasses[0],
    id: 1,
    user: user.data,
  ),
);
