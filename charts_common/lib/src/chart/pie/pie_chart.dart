// Copyright 2018 the Charts project authors. Please see the AUTHORS file
// for details.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'arc_renderer.dart' show ArcRenderer;
import '../common/base_chart.dart' show BaseChart;
import '../common/processed_series.dart' show MutableSeries;
import '../common/series_renderer.dart' show SeriesRenderer;
import '../layout/layout_config.dart' show LayoutConfig, MarginSpec;

class PieChart<T, D> extends BaseChart<T, D> {
  static final _defaultLayoutConfig = new LayoutConfig(
    topSpec: new MarginSpec.fromPixel(minPixel: 20),
    bottomSpec: new MarginSpec.fromPixel(minPixel: 20),
    leftSpec: new MarginSpec.fromPixel(minPixel: 20),
    rightSpec: new MarginSpec.fromPixel(minPixel: 20),
  );

  PieChart({LayoutConfig layoutConfig})
      : super(layoutConfig: layoutConfig ?? _defaultLayoutConfig);

  @override
  void drawInternal(List<MutableSeries<T, D>> seriesList,
      {bool skipAnimation, bool skipLayout}) {
    if (seriesList.length > 1) {
      throw new ArgumentError('PieChart can only render a single series');
    }
    super.drawInternal(seriesList,
        skipAnimation: skipAnimation, skipLayout: skipLayout);
  }

  @override
  SeriesRenderer<T, D> makeDefaultRenderer() {
    return new ArcRenderer<T, D>()
      ..rendererId = SeriesRenderer.defaultRendererId;
  }
}
