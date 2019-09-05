import 'package:flutter_tests/ui/others/animation_utils.dart';
import 'package:mockito/mockito.dart';

class MockAnimationUtils extends Mock implements AnimationUtils {
  Duration get expandCollapseDuration => Duration.zero;
}