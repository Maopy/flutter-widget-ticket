import 'package:fw_ticket/fw_ticket.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter widget ticket'),
        ),
        body: Container(
          width: 375,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 30.0,),
              Ticket(
                innerRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0)
                ),
                outerRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4.0),
                    blurRadius: 2.0,
                    spreadRadius: 2.0,
                    color: Color.fromRGBO(196, 196, 196, .76),
                  )
                ],
                child: Image.asset(
                  'assets/bohemian_rapsody.png',
                ),
              ),
              Ticket(
                innerRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0)
                ),
                outerRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 2.0,
                    spreadRadius: 2.0,
                    color: Color.fromRGBO(196, 196, 196, .76),
                  )
                ],
                child: Container(
                  color: Colors.white,
                  width: 300,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(
                              Icons.remove,
                              color: Colors.lightBlue,
                            ),
                            Text(
                              '2 TICKET',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            Icon(
                              Icons.add,
                              color: Colors.lightBlue,
                            ),
                          ],
                        ),
                      ),
                      Divider(height: 0.0),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Date'),
                                  FittedBox(
                                    child: Text(
                                      '08/17   ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18.0),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Time'),
                                    FittedBox(
                                      child: Text(
                                        '9:00PM',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18.0),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Price'),
                                    FittedBox(
                                      child: Text(
                                        '\$15.00  ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18.0),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        color: Colors.lightBlue,
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Center(
                          child: Text(
                            'BUY TICKETS',
                            style:
                            TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
