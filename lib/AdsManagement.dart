// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'dart:io';

// class AdState {
//   Future<InitializationStatus> initialization;

//   AdState({
//     required this.initialization,
//   });

//   String get bannerAdUnitId => 'ca-app-pub-3940256099942544/6300978111';

//   AdListener get adListener => _adListener;

//   AdListener _adListener = AdListener(
//     onAdLoaded: (Ad ad) => print('Ad loaded'),
//     onAdFailedToLoad: (Ad ad, LoadAdError error) {
//       ad.dispose();
//       print('Ad failed to load: $error');
//     },
//     onAdOpened: (Ad ad) => print('Ad opened'),
//     onAdClosed: (Ad ad) => print('Ad closed'),
//   );
// }
