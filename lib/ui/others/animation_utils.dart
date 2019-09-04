
class AnimationUtils {
  static const _expandCollapseDuration = Duration(milliseconds: 250);

  static const AnimationUtils sharedInstance = AnimationUtils._internal();

  const AnimationUtils._internal();

  Duration get expandCollapseDuration => _expandCollapseDuration;
}