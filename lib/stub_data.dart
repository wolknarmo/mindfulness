import 'package:mindfulness/models.dart';

final meditationGroups = [
  Group("MOST POPULAR", popularMeditations),
  Group("DAILY ROUTINE", dailyMeditations),
];
final coursesGroups = [
  Group("YOGA", yogaCourse),
  Group("ADVANCED YOGA", advancedYogaCourse),
];
final soundsGroups = [
  Group("RELAX SOUNDS", relaxSounds),
  Group("SLEEP SOUNDS", sleepSounds),
];

final popularMeditations = [
  Item(title: "Popular 1", background: "assets/bg_meditation1.jpg", audioAsset: "assets/song1.mp3"),
  Item(title: "Popular 2", background: "assets/bg_meditation1.jpg", audioAsset: "assets/song1.mp3"),
];

final dailyMeditations = [
  Item(title: "Everyday 1", background: "assets/bg_meditation2.jpg", audioAsset: "assets/song2.mp3"),
  Item(title: "Everyday 2", background: "assets/bg_meditation2.jpg", audioAsset: "assets/song2.mp3"),
];

final yogaCourse = [
  Item(title: "Yoga 1", background: "assets/bg_yoga1.jpg", audioAsset: "assets/song1.mp3"),
  Item(title: "Yoga 2", background: "assets/bg_yoga1.jpg", audioAsset: "assets/song1.mp3"),
];

final advancedYogaCourse = [
  Item(title: "Advanced yoga 1", background: "assets/bg_yoga2.jpg", audioAsset: "assets/song2.mp3"),
  Item(title: "Advanced yoga 2", background: "assets/bg_yoga2.jpg", audioAsset: "assets/song2.mp3"),
];

final relaxSounds = [
  Item(title: "Relax 1", background: "assets/bg_relax.jpg", audioAsset: "assets/song1.mp3"),
  Item(title: "Relax 2", background: "assets/bg_relax.jpg", audioAsset: "assets/song1.mp3"),
];

final sleepSounds = [
  Item(title: "Sleep 1", background: "assets/bg_sleep.jpg", audioAsset: "assets/song2.mp3"),
  Item(title: "Sleep 2", background: "assets/bg_sleep.jpg", audioAsset: "assets/song2.mp3"),
];
