import 'package:d_chart/bar_custom/view.dart';
import 'package:flutter/material.dart';

class BarChart extends StatefulWidget {
  const BarChart({super.key});

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7.0),
      margin: const EdgeInsets.only(top: 20),
      color: const Color.fromARGB(14, 228, 228, 59),
      child: Column(children: [
        const ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Patients Visits',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
              ),
              Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    size: 24.0,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 24.0,
                  )
                ],
              )
            ],
          ),
          subtitle: Text(
            '24 OCT - 30 OCT',
            style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          color: const Color.fromARGB(255, 225, 222, 163).withOpacity(0.1),
          margin: const EdgeInsets.only(top: 15.0),
          padding: const EdgeInsets.all(10),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: DChartBarCustom(
              showDomainLabel: true,
              showMeasureLabel: true,
              showLoading: true,
              radiusBar: BorderRadius.circular(10),
              spaceBetweenItem: 10,

              max: 100,
              listData: [
                DChartBarDataCustom(value: 70, label: 'sat', color: Colors.green,splashColor: Colors.blue,showValue: true,labelCustom: Text('sat',style: TextStyle(fontSize: 10),)),
                DChartBarDataCustom(value: 30, label: 'sun', color: Colors.green ,showValue: true ,labelCustom: Text('sun',style: TextStyle(fontSize: 10))),
                DChartBarDataCustom(value: 52, label: 'mon', color: Colors.green,showValue: true,labelCustom: Text('mon',style: TextStyle(fontSize: 10))),
                DChartBarDataCustom(value: 75, label: 'tus', color: Colors.green,showValue: true,labelCustom: Text('tus',style: TextStyle(fontSize: 10))),
                DChartBarDataCustom(value: 65, label: 'wed', color: Colors.green,showValue: true,labelCustom: Text('wed',style: TextStyle(fontSize: 10))),
                DChartBarDataCustom(value: 90, label: 'thr', color: Colors.green,showValue: true,labelCustom: Text('thr',style: TextStyle(fontSize: 10))),
                DChartBarDataCustom(value: 25, label: 'fri', color: Colors.green,showValue: true,labelCustom: Text('fri',style: TextStyle(fontSize: 10))),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
