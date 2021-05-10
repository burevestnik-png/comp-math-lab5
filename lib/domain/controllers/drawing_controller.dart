import 'package:comp_math_lab5/domain/models/dot.dart';
import 'package:comp_math_lab5/presentation/main_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// [
///   axisX
///   axisY
/// ]
class DrawingController extends GetxController {
  static const _kPaddingValue = 5;
  static const _kDefaultMax = 15.0;
  static const _kDefaultMin = -15.0;

  static const _kAxisXPlace = 0;
  static const _kAxisYPlace = 1;

  static const kNewLineIndex = 0;

  var currentMinX = _kDefaultMin;
  var currentMaxX = _kDefaultMax;
  var currentMinY = _kDefaultMin;
  var currentMaxY = _kDefaultMax;

  var availableId = 0;

  late final LineChartData chartData;
  final List<LineChartBarData> _lines = [];
  final Map<int, int> _linesPositions = {};

  var cachedMinX = _kDefaultMin;
  var cachedMaxX = _kDefaultMax;
  var cachedMinY = _kDefaultMin;
  var cachedMaxY = _kDefaultMax;
  final List<LineChartBarData> _cache = [];

  @override
  void onInit() {
    super.onInit();
    chartData = init();
    _drawAxisX();
    _drawAxisY();
  }

  LineChartData init() {
    return LineChartData(
      gridData: _drawGrid(),
      maxX: _kDefaultMax,
      maxY: _kDefaultMax,
      minX: _kDefaultMin,
      minY: _kDefaultMin,
      lineTouchData: LineTouchData(
        enabled: false,
        touchTooltipData:
            LineTouchTooltipData(tooltipBgColor: Colors.white.withOpacity(0.8)),
        handleBuiltInTouches: true,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: _drawTitles(),
        leftTitles: _drawTitles(),
      ),
      lineBarsData: _lines,
    );
  }

  int drawLineByDots(
    List<Dot> dots, {
    int id = kNewLineIndex,
    bool shouldForceRedraw = false,
    bool isCurved = false,
    bool showDots = true,
    Color color = Colors.red,
    double barWidth = 2,
  }) {
    if (dots.isEmpty) {
      _resetGridSize();
      if (_linesPositions.containsKey(id)) {
        removeLine(id);
        if (shouldForceRedraw) Get.offAndToNamed(MainScreen.id);
      }
      return kNewLineIndex;
    }

    currentMinX = dots.minX().x;
    currentMaxX = dots.maxX().x;
    currentMinY = dots.minY().y;
    currentMaxY = dots.maxY().y;
    _updateGridSize();

    var newLine = LineChartBarData(
      spots: dots.toFLSpots(),
      isCurved: isCurved,
      colors: [color],
      barWidth: barWidth,
      dotData: FlDotData(show: showDots),
    );

    if (!_linesPositions.containsKey(id)) {
      var lineId = generateLineId();
      _linesPositions[lineId] = _lines.length;
      _lines.add(newLine);

      return lineId;
    } else {
      final linePosition = _linesPositions[id]!;
      _lines.removeAt(linePosition);
      _lines.insert(linePosition, newLine);

      if (shouldForceRedraw) Get.offAndToNamed(MainScreen.id);

      return id;
    }
  }

  void removeLine(int id) {
    if (_linesPositions.containsKey(id) &&
        _lines.asMap().containsKey(_linesPositions[id])) {
      _lines.removeAt(_linesPositions[id]!);
      _linesPositions.forEach((key, value) {
        if (_linesPositions[id]! < value) {
          _linesPositions[key] = --value;
        }
      });
      _linesPositions.remove(id);

      Get.offAndToNamed(MainScreen.id);
    }
  }

  void cacheAndCleanChart() {
    var tmpCache = <LineChartBarData>[];
    for (int i = 2; i < _lines.length; i++) {
      tmpCache.add(_lines[i]);
    }

    _lines.clear();
    _drawAxisX();
    _drawAxisY();

    _cache.forEach((element) => _lines.add(element));
    _cache.clear();

    _swapCachedGridSizes();
    _updateGridSize();

    _cache.addAll(tmpCache);
  }

  void _swapCachedGridSizes() {
    var tmp = cachedMinY;
    cachedMinY = currentMinY;
    currentMinY = tmp;

    tmp = cachedMaxY;
    cachedMaxY = currentMaxY;
    currentMaxY = tmp;

    tmp = cachedMaxX;
    cachedMaxX = currentMaxX;
    currentMaxX = tmp;

    tmp = cachedMinX;
    cachedMinX = currentMinX;
    currentMinX = tmp;
  }

  int generateLineId() => ++availableId;

  void _resetGridSize() {
    currentMinX = _kDefaultMin;
    currentMaxX = _kDefaultMax;
    currentMinY = _kDefaultMin;
    currentMaxY = _kDefaultMax;
    _updateGridSize();
  }

  void _updateGridSize() {
    chartData.minX = (currentMinX - _kPaddingValue).ceilToDouble();
    chartData.maxX = (currentMaxX + _kPaddingValue).ceilToDouble();

    chartData.maxY = (currentMaxY + _kPaddingValue).ceilToDouble();
    chartData.minY = (currentMinY - _kPaddingValue).ceilToDouble();

    _drawAxisX();
    _drawAxisY();
  }

  void _drawAxisY() =>
      _drawAxis(kPlace: _kAxisYPlace, from: gridMinY, to: gridMaxY);

  void _drawAxisX() =>
      _drawAxis(kPlace: _kAxisXPlace, from: gridMinX, to: gridMaxX);

  void _drawAxis({
    required int kPlace,
    required double from,
    required double to,
  }) {
    LineChartBarData defaultStyledAxis(List<FlSpot> dots) {
      return LineChartBarData(
        spots: dots,
        colors: [Colors.black],
        barWidth: 3,
        dotData: FlDotData(
          show: false,
        ),
      );
    }

    if (_lines.asMap().containsKey(kPlace)) _lines.removeAt(kPlace);

    List<FlSpot> dots = [];
    dots.addAll(kPlace == _kAxisXPlace
        ? [FlSpot(from, 0), FlSpot(to, 0)]
        : [FlSpot(0, from), FlSpot(0, to)]);

    _lines.insert(kPlace, defaultStyledAxis(dots));
  }

  SideTitles _drawTitles() => SideTitles(
        showTitles: true,
        reservedSize: 30,
        getTextStyles: (value) => const TextStyle(
          color: Color(0xff68737d),
          fontWeight: FontWeight.normal,
          fontSize: 11,
        ),
        getTitles: (value) {
          return value.toInt().toString();
        },
        margin: 8,
      );

  FlGridData _drawGrid() => FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      );

  double get gridMinX => chartData.minX;

  double get gridMaxX => chartData.maxX;

  double get gridMinY => chartData.minY;

  double get gridMaxY => chartData.maxY;

  bool get isEmpty => _lines.length == 2 && _cache.length == 0;
}
