import 'package:flutter/material.dart';
import 'package:manekin/helper/custom_appbar.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

import '../../data/Mockup_API.dart';

class LiveScreen extends StatefulWidget {
  const LiveScreen({super.key});

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  List<Mockup> _chartData = [];

  @override
  void initState() {
    super.initState();
    getChartData();
  }

  getChartData() {
    List<Mockup> chartData = [];
    chartData.add(Mockup(
      date: 2010,
      value: 20,
      sensor: "Sensor 1",
      nama_data: "Data 1",
    ));
    chartData.add(Mockup(
      date: 2011,
      value: 24,
      sensor: "Sensor 2",
      nama_data: "Data 2",
    ));
    chartData.add(Mockup(
      date: 2012,
      value: 33,
      sensor: "Sensor 3",
      nama_data: "Data 3",
    ));
    chartData.add(Mockup(
      date: 2013,
      value: 44,
      sensor: "Sensor 4",
      nama_data: "Data 4",
    ));
    chartData.add(Mockup(
      date: 2014,
      value: 52,
      sensor: "Sensor 5",
      nama_data: "Data 5",
    ));

    setState(() {
      _chartData = chartData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar('Live Screen'),
      body: SafeArea(
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: _chartData.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            final data = _chartData[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.white,
                elevation: 2,
                child: SfCartesianChart(
                  title: ChartTitle(text: data.nama_data),
                  legend:
                      Legend(isVisible: true, position: LegendPosition.bottom),
                  series: <ChartSeries>[
                    LineSeries<Mockup, double>(
                      name: data.sensor,
                      dataSource: _chartData,
                      xValueMapper: (Mockup mockup, _) => mockup.date,
                      yValueMapper: (Mockup mockup, _) => mockup.value,
                      dataLabelSettings: DataLabelSettings(isVisible: true),
                    )
                  ],
                  primaryXAxis: NumericAxis(
                    edgeLabelPlacement: EdgeLabelPlacement.shift,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
