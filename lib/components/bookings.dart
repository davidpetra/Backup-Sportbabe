import 'dart:async';

import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              flexibleSpace: new Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    new TabBar(tabs: [
                      Tab(text: "Active Booking"),
                      Tab(text: "History")
                    ]),
                  ]),
            ),
            body: TabBarView(
              children: <Widget>[
                ListView(
                  padding: EdgeInsets.all(8),
                  children: <Widget>[
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      color: Colors.white,
                      elevation: 10,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const ListTile(
                              contentPadding: EdgeInsets.all(10),
                              title: Text('GOR Saparua',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              subtitle: Text(
                                  'Sabtu, 1 Februari 2020\n19.00 - 21.00')),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              ButtonBar(
                                children: <Widget>[
                                  FlatButton(
                                    child: const Text("Basket",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  )
                                ],
                              ),
                              ButtonBar(
                                children: <Widget>[
                                  FlatButton(
                                      child: const Text('Cancel',
                                          style:
                                              TextStyle(color: Colors.white)),
                                      color: Color(0xffc62828),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      onPressed: () {
                                        showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: const Text('Cancel Booking',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            content: Text(
                                                'Are you sure want to cancel your booking?'),
                                            actions: <Widget>[
                                              FlatButton(
                                                  child: Text('No',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  onPressed: () =>
                                                      Navigator.pop(context)),
                                              FlatButton(
                                                  child: Text(
                                                      'Yes, cancel booking',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  color: Color(0xffc62828),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, 'Cancel'))
                                            ],
                                          ),
                                        ).then((returnVal) {
                                          if (returnVal != null) {
                                            if (returnVal == 'Cancel') {
                                              Scaffold.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Text(
                                                    'You have cancelled your booking'),
                                                action: SnackBarAction(
                                                    label: 'OK',
                                                    textColor: Colors.white,
                                                    onPressed: () {}),
                                              ));
                                            }
                                          }
                                        });
                                      })
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      color: Colors.white,
                      elevation: 10,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const ListTile(
                            contentPadding: EdgeInsets.all(10),
                            title: Text('GOR Saraga',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle:
                                Text('Minggu, 2 Februari 2020\n15.00 - 17.00'),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              ButtonBar(
                                children: <Widget>[
                                  FlatButton(
                                    child: const Text("Futsal",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  )
                                ],
                              ),
                              ButtonBar(
                                children: <Widget>[
                                  FlatButton(
                                      child: const Text('Cancel',
                                          style:
                                              TextStyle(color: Colors.white)),
                                      color: Color(0xffc62828),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      onPressed: () {
                                        showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: const Text('Cancel Booking',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            content: Text(
                                                'Are you sure want to cancel your booking?'),
                                            actions: <Widget>[
                                              FlatButton(
                                                  child: Text('No',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  onPressed: () =>
                                                      Navigator.pop(context)),
                                              FlatButton(
                                                  child: Text(
                                                      'Yes, cancel booking',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  color: Color(0xffc62828),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, 'Cancel'))
                                            ],
                                          ),
                                        ).then((returnVal) {
                                          if (returnVal != null) {
                                            if (returnVal == 'Cancel') {
                                              Scaffold.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Text(
                                                    'You have cancelled your booking'),
                                                action: SnackBarAction(
                                                    label: 'OK',
                                                    textColor: Colors.white,
                                                    onPressed: () {}),
                                              ));
                                            }
                                          }
                                        });
                                      })
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Text("You haven't got any Booking History before!"),
                ),
              ],
            )));
  }
}
