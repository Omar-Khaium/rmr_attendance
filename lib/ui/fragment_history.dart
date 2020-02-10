import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rmr_attendance/model/attendance.dart';
import 'package:rmr_attendance/widget/widget_date_filter.dart';
import 'package:rmr_attendance/widget/widget_google_map.dart';

class HistoryFragment extends StatefulWidget {
  @override
  _HistoryFragmentState createState() => _HistoryFragmentState();
}

class _HistoryFragmentState extends State<HistoryFragment> {
  List<Attendance> _items = [
    Attendance(
        1,
        "09:00 am",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        0.0,
        "01:00 pm",
        "Lorem Ipsum",
        0.0,
        4),
    Attendance(
        2, "01:50 am", "Lorem Ipsum", 0.0, "07:20 pm", "Lorem Ipsum", 0.0, 6.5),
  ];
  List<Step> _stepItems = [];

  int _currentStep = 0;

  @override
  void initState() {
    _stepItems = [
      Step(
        isActive: true,
        title: Text("01/20/2020"),
        content: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                child: ListTile(
                  title: Text(
                    "${_items[index].duration.toString()} hours",
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  subtitle: RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.body1,
                      children: <TextSpan>[
                        TextSpan(
                            text: 'In ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green)),
                        TextSpan(text: _items[index].clockedInAt),
                        TextSpan(text: " - "),
                        TextSpan(
                            text: 'Out ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red)),
                        TextSpan(text: _items[index].clockedOutAt),
                      ],
                    ),
                  ),
                  trailing: InkWell(
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade100,
                      child: Icon(
                        Icons.fullscreen,
                        size: 18,
                      ),
                    ),
                    onTap: () => showDetails(_items[index]),
                  ),
                ),
              );
            },
            itemCount: _items.length),
      ),
      Step(
        isActive: true,
        title: Text("01/20/2020"),
        content: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                child: ListTile(
                  title: Text(
                    "${_items[index].duration.toString()} hours",
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  subtitle: RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.body1,
                      children: <TextSpan>[
                        TextSpan(
                            text: 'In ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green)),
                        TextSpan(text: _items[index].clockedInAt),
                        TextSpan(text: " - "),
                        TextSpan(
                            text: 'Out ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red)),
                        TextSpan(text: _items[index].clockedOutAt),
                      ],
                    ),
                  ),
                  trailing: InkWell(
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade100,
                      child: Icon(
                        Icons.fullscreen,
                        size: 18,
                      ),
                    ),
                    onTap: () => showDetails(_items[index]),
                  ),
                ),
              );
            },
            itemCount: _items.length),
      ),
      Step(
        isActive: true,
        title: Text("01/20/2020"),
        content: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                child: ListTile(
                  title: Text(
                    "${_items[index].duration.toString()} hours",
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  subtitle: RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.body1,
                      children: <TextSpan>[
                        TextSpan(
                            text: 'In ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green)),
                        TextSpan(text: _items[index].clockedInAt),
                        TextSpan(text: " - "),
                        TextSpan(
                            text: 'Out ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red)),
                        TextSpan(text: _items[index].clockedOutAt),
                      ],
                    ),
                  ),
                  trailing: InkWell(
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade100,
                      child: Icon(
                        Icons.fullscreen,
                        size: 18,
                      ),
                    ),
                    onTap: () => showDetails(_items[index]),
                  ),
                ),
              );
            },
            itemCount: _items.length),
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DateFilterWidget(),
              fullscreenDialog: true)),
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(MdiIcons.filter),
              SizedBox(
                width: 4,
              ),
              Text("Filter"),
            ],
          )),
      body: Stepper(
        physics: ScrollPhysics(),
        type: StepperType.vertical,
        steps: _stepItems,
        controlsBuilder: (BuildContext context,
            {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
          return Row(
            children: <Widget>[
              FlatButton(
                onPressed: _currentStep == 0 ? null : onStepCancel,
                child: const Text('Previous'),
              ),
              FlatButton(
                onPressed: _currentStep == (_stepItems.length - 1)
                    ? null
                    : onStepContinue,
                child: const Text('Next'),
              ),
            ],
          );
        },
        currentStep: _currentStep,
        onStepContinue: () {
          setState(() {
            _currentStep = _currentStep + 1;
          });
        },
        onStepCancel: () {
          setState(() {
            _currentStep = _currentStep - 1;
          });
        },
        onStepTapped: (index) {
          setState(() {
            _currentStep = index;
          });
        },
      ),
    );
  }

  showDetails(Attendance attendance) {
    showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 4,
              sigmaY: 4,
            ),
            child: AlertDialog(
              content: SizedBox(
                width: 300,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  child: ListView(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "In",
                            style: Theme.of(context).textTheme.subhead.copyWith(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.green,
                            size: 16,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            child: Text(
                              attendance.clockedInAt,
                              style: Theme.of(context).textTheme.body1.copyWith(
                                    color: Colors.green,
                                    fontWeight: FontWeight.normal,
                                  ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Note",
                        style: Theme.of(context).textTheme.subhead.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 16, right: 16),
                          child: Wrap(
                            children: <Widget>[
                              Text(
                                attendance.clockedInNote,
                                style:
                                    Theme.of(context).textTheme.body1.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        ),
                                textAlign: TextAlign.justify,
                              )
                            ],
                          )),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 150,
                        child: GoogleMapUI(),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: 100,
                        height: 1,
                        decoration: BoxDecoration(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "Duration",
                            style: Theme.of(context).textTheme.subhead.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                            size: 16,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            child: Text(
                              "${attendance.duration} hours",
                              style: Theme.of(context).textTheme.body1.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: 100,
                        height: 1,
                        decoration: BoxDecoration(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "Out",
                            style: Theme.of(context).textTheme.subhead.copyWith(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 48,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.red,
                            size: 16,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                              child: Text(
                            attendance.clockedOutAt,
                            style: Theme.of(context).textTheme.body1.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Note",
                        style: Theme.of(context).textTheme.subhead.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 16, right: 16),
                          child: Wrap(
                            children: <Widget>[
                              Text(
                                attendance.clockedOutNote,
                                style:
                                    Theme.of(context).textTheme.body1.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        ),
                              )
                            ],
                          )),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 150,
                        child: GoogleMapUI(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
