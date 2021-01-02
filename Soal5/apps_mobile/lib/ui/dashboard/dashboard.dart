import 'package:apps_mobile/provider/dashboard/dashboard_state.dart';
import 'package:apps_mobile/utils/v_color.dart';
import 'package:apps_mobile/widget/v_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DashboardState(),
      child: Consumer(
        builder: (BuildContext context, DashboardState state, Widget child) {
          return SafeArea(
            child: Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  header(),
                  SizedBox(height: 18),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: vText(
                        '${state.formattedDate} ${state.dayNow} ${state.formattedYear}',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: VColor.main),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: double.infinity,
                    height: 88,
                    child: ListView.builder(
                        itemCount: state.day.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (c, i) => _itemList(state, i)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: vText("Task List",
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: state.hours.length,
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    itemBuilder: (c, i) {
                      String after = i == state.hours.length
                          ? state.hours[i + 1]
                          : state.hours[i];
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin: EdgeInsets.only(bottom: 67),
                              child: vText(state.hours[i].toString())),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.blue[100],
                                borderRadius: BorderRadius.circular(12)),
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    vText(
                                      "Daily Stand Up",
                                      color: VColor.main,
                                    ),
                                    Icon(
                                      Icons.more_vert,
                                      color: VColor.main,
                                    )
                                  ],
                                ),
                                vText(state.hours[i] + " - " + after,
                                    color: Colors.blue[50])
                              ],
                            ),
                          ),
                          state.isComplate[i] == true
                              ? InkWell(
                                  onTap: () => state.onComplated(i),
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 12),
                                    decoration: BoxDecoration(
                                        color: Colors.red[200],
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.check,
                                          color: Colors.red[700],
                                        ),
                                        vText(
                                          "Complate",
                                          color: Colors.red[700],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : InkWell(
                                  onTap: () => state.onComplated(i),
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 12),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.check,
                                          color: Colors.grey[700],
                                        ),
                                        vText(
                                          "Complate",
                                          color: Colors.grey[700],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                        ],
                      );
                    },
                  )),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(color: Colors.grey, blurRadius: 6)
                    ]),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset("assets/view_schedule.png"),
                              vText("Icon")
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: VColor.main,
                              borderRadius: BorderRadius.circular(15)),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset("assets/setting.png"),
                              vText("Setting")
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _itemList(DashboardState state, int i) {
    int number = i + 1;
    return InkWell(
      onTap: () {
        state.onClickedDate(number);
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            color: number != state.dayNow ? Colors.grey[200] : VColor.main,
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (state.day[i] == "W" || state.day[i] == "T")
              Container(
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(72)),
                width: 7,
                height: 7,
              ),
            Container(
              child: vText(
                state.day[i],
                color: number == state.dayNow ? Colors.white : Colors.black,
              ),
            ),
            Container(
              child: vText(
                number.toString(),
                color: number == state.dayNow ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Container(
      width: double.infinity,
      height: 108,
      color: VColor.main,
      padding: EdgeInsets.only(top: 37, bottom: 15),
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                  width: 56,
                  height: 56,
                  margin: EdgeInsets.only(
                    left: 10,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(72),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/poto_profile.png")))),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  vText("Hallo, Sam!",
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                  SizedBox(height: 7),
                  vText("2 Task for Today",
                      fontSize: 20,
                      color: VColor.secondaryMain,
                      fontWeight: FontWeight.w900)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
