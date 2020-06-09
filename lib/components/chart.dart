import 'package:banking_app/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AccountChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AccountChartState();
}

class AccountChartState extends State<AccountChart> {
  final Color barBackgroundColor = const Color(0x22acb7cf);
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        color: const Color(0xffffffff),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    'Seu Rendimento',
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Histórico Mensal',
                    style: TextStyle(
                        color: Colors.blueGrey[600],
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 38,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: BarChart(
                        mainBarData(),
                        swapAnimationDuration: animDuration,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 1 : y,
          color: isTouched ? kPrimaryColor : kAccentColor,
          width: width,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 2000,
            color: barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 500, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, 600.5, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, 500, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, 700.5, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, 900, isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, 1100.5, isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, 600.5, isTouched: i == touchedIndex);
          default:
            return null;
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String month;
              switch (group.x.toInt()) {
                case 0:
                  month = 'Novembro';
                  break;
                case 1:
                  month = 'Dezembro';
                  break;
                case 2:
                  month = 'Janeiro';
                  break;
                case 3:
                  month = 'Fevereiro';
                  break;
                case 4:
                  month = 'Março';
                  break;
                case 5:
                  month = 'Abril';
                  break;
                case 6:
                  month = 'Maio';
                  break;
              }
              return BarTooltipItem(month + '\n' + (rod.y - 1).toString(),
                  TextStyle(color: Colors.white));
            }),
        touchCallback: (barTouchResponse) {
          setState(() {
            if (barTouchResponse.spot != null &&
                barTouchResponse.touchInput is! FlPanEnd &&
                barTouchResponse.touchInput is! FlLongPressEnd) {
              touchedIndex = barTouchResponse.spot.touchedBarGroupIndex;
            } else {
              touchedIndex = -1;
            }
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
              color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 14),
          margin: 16,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'Nov';
              case 1:
                return 'Dez';
              case 2:
                return 'Jan';
              case 3:
                return 'Fev';
              case 4:
                return 'Mar';
              case 5:
                return 'Abr';
              case 6:
                return 'Mai';
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
    );
  }
}
