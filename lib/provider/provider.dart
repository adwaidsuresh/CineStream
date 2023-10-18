// import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:movieapp/view/watchlist.dart';

final bottomProvider = StateProvider<int>((ref) {
  return 0;
});

final iconProvider = StateProvider<bool>((ref) {
  return false;
});
final containerProvider = StateProvider<bool>((ref) {
  return false;
});

final colorProvider = StateProvider<bool>((ref) {
  return false;
});
final moviesProvider = StateProvider<bool>((ref) {
  return false;
});
final listProvider = StateProvider<bool>((ref) {
  return false;
});
final latestProvider = StateProvider<String>((ref) {
  return '';
});
final addProvider = StateProvider<List<String>>((ref) {
  return [];
});
