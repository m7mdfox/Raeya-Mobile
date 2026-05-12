import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/raeya_colors.dart';

class EmotionalPulseChartCard extends StatelessWidget {
  const EmotionalPulseChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: Text(
                  'Weekly Emotional Pulse',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: RaeyaColors.textPrimary,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              _buildLegend(),
            ],
          ),
          const SizedBox(height: 32),
          SizedBox(
            height: 200,
            child: LineChart(
              _buildChartData(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegend() {
    return Row(
      children: [
        _legendItem('Joy', RaeyaColors.success),
        const SizedBox(width: 12),
        _legendItem('Anxiety', RaeyaColors.error),
        const SizedBox(width: 12),
        _legendItem('Focus', RaeyaColors.primary),
      ],
    );
  }

  Widget _legendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: RaeyaColors.textSecondary,
          ),
        ),
      ],
    );
  }

  LineChartData _buildChartData() {
    return LineChartData(
      gridData: const FlGridData(show: false),
      titlesData: FlTitlesData(
        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
              if (value >= 0 && value < days.length) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    days[value.toInt()],
                    style: const TextStyle(
                      color: RaeyaColors.textSecondary,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
            reservedSize: 30,
            interval: 1,
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      lineBarsData: [
        _generateLineData(
          [3, 4, 3.5, 5, 4.5, 6, 5.5],
          RaeyaColors.success,
        ),
        _generateLineData(
          [1, 1.5, 1, 2, 1.5, 1, 0.5],
          RaeyaColors.error,
        ),
        _generateLineData(
          [4, 3.5, 5, 4, 5.5, 5, 6],
          RaeyaColors.primary,
        ),
      ],
      lineTouchData: const LineTouchData(enabled: true),
    );
  }

  LineChartBarData _generateLineData(List<double> spots, Color color) {
    return LineChartBarData(
      spots: spots.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value)).toList(),
      isCurved: true,
      color: color,
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
    );
  }
}
