import 'package:responsive_builder/responsive_builder.dart';

class Responsive {
  static void init() {
    ResponsiveSizingConfig.instance.setCustomBreakpoints(
      const ScreenBreakpoints(desktop: 800, tablet: 550, watch: 200),
    );
  }
}
