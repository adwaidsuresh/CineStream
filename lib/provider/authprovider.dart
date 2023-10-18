import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/services/authservice.dart';

final authswitchProvider = Provider<PageController>(
  (ref) {
    return PageController();
  },
);
final authserviceProvider = Provider<Authservices>(
  (ref) {
    return Authservices();
  },
);
final authStateChangeProvider = StreamProvider<User?>(
  (ref) {
    return Authservices.authSateChange();
  },
);
