import 'dart:math';
import 'package:flutter/rendering.dart';

/// A custom SliverGridLayout that allows centering the last row if it's incomplete.
class SliverGridWithCustomGeometryLayout extends SliverGridRegularTileLayout {
  final SliverGridGeometry Function(
    int index,
    SliverGridRegularTileLayout layout,
  )
  geometryBuilder;

  const SliverGridWithCustomGeometryLayout({
    required this.geometryBuilder,
    required super.crossAxisCount,
    required super.mainAxisStride,
    required super.crossAxisStride,
    required super.childMainAxisExtent,
    required super.childCrossAxisExtent,
    required super.reverseCrossAxis,
  });

  @override
  SliverGridGeometry getGeometryForChildIndex(int index) {
    return geometryBuilder(index, this);
  }
}

/// A SliverGridDelegate that centers the last row's items if the last row is incomplete.
class SliverGridDelegateWithFixedCrossAxisCountAndCentralizedLastElement
    extends SliverGridDelegateWithFixedCrossAxisCount {
  final int itemCount;

  SliverGridDelegateWithFixedCrossAxisCountAndCentralizedLastElement({
    required this.itemCount,
    required super.crossAxisCount,
    super.mainAxisSpacing,
    super.crossAxisSpacing,
    super.childAspectRatio,
  });

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    final usableCrossAxisExtent = max(
      0.0,
      constraints.crossAxisExtent - crossAxisSpacing * (crossAxisCount - 1),
    );

    final childCrossAxisExtent = usableCrossAxisExtent / crossAxisCount;
    final childMainAxisExtent = childCrossAxisExtent / childAspectRatio;

    return SliverGridWithCustomGeometryLayout(
      geometryBuilder: (index, layout) {
        // Calculate whether this item is on the last row
        int fullRows = itemCount ~/ crossAxisCount;
        int lastRowItemCount = itemCount % crossAxisCount;
        if (lastRowItemCount == 0) lastRowItemCount = crossAxisCount;

        bool isLastRow = (index ~/ crossAxisCount) == fullRows;

        // Offset to center items in last row if incomplete
        double offsetForCentering = 0.0;
        if (isLastRow) {
          offsetForCentering =
              (crossAxisCount - lastRowItemCount) *
              (layout.childCrossAxisExtent + crossAxisSpacing) /
              2;
        }

        double crossAxisOffset =
            (index % crossAxisCount) * layout.crossAxisStride +
            offsetForCentering;

        return SliverGridGeometry(
          scrollOffset: (index ~/ crossAxisCount) * layout.mainAxisStride,
          crossAxisOffset: crossAxisOffset,
          mainAxisExtent: childMainAxisExtent,
          crossAxisExtent: childCrossAxisExtent,
        );
      },
      crossAxisCount: crossAxisCount,
      mainAxisStride: childMainAxisExtent + mainAxisSpacing,
      crossAxisStride: childCrossAxisExtent + crossAxisSpacing,
      childMainAxisExtent: childMainAxisExtent,
      childCrossAxisExtent: childCrossAxisExtent,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }
}
