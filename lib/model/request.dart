class Request {
  String userName;
  // String fieldName;
  String reserveTime;
  String reserveStatus;
  Request({
    required this.userName,
    // required this.fieldName,
    required this.reserveTime,
    required this.reserveStatus,
  });
}

List<Request> requests = [
  Request(
      userName: 'مصطفى', reserveStatus: 'انتظار', reserveTime: '17:00-18:00'),
  Request(userName: 'علي', reserveStatus: 'حجز', reserveTime: '19:00-20:00'),
  Request(userName: 'علي', reserveStatus: 'حجز', reserveTime: '19:00-20:00'),
  Request(userName: 'علي', reserveStatus: 'حجز', reserveTime: '19:00-20:00'),
];
