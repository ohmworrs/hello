import 'package:corperate_banking/global_function.dart';
import 'package:corperate_banking/pageTo.dart';
import 'package:corperate_banking/screens/screens_transaction/screens_multi_transfer/select_account_to_add_group_screen.dart';
import 'package:corperate_banking/screens/screens_transaction/screens_multi_transfer/create_order_multi_transfer_screen.dart';
import 'package:flutter/material.dart';

class CheckMultiTransferScreen extends StatefulWidget {
  String groupName;
  String fromAcctNo;
  String fromBankName;
  String fromAcctName;

  CheckMultiTransferScreen({this.groupName,this.fromBankName,this.fromAcctNo,this.fromAcctName});
  @override
  _CheckMultiTransferScreenState createState() =>
      _CheckMultiTransferScreenState(groupName: groupName,fromBankName: fromBankName,fromAcctNo: fromAcctNo,fromAcctName: fromAcctName);
}

class _CheckMultiTransferScreenState extends State<CheckMultiTransferScreen> {
  String groupName;
  String fromAcctNo;
  String fromBankName;
  String fromAcctName;
  _CheckMultiTransferScreenState({this.groupName,this.fromAcctNo,this.fromBankName,this.fromAcctName});
  FunctionGlobal func = FunctionGlobal();
  List<AccountUser> res = [
    AccountUser(
        acctName: 'ตัวอย่าง ตัวอย่าง',
        acctNo: '123-123123-1',
        bankName: 'ไทยพาณิชย์',
        amount: 100,
        ischeck: false),
    AccountUser(
        acctName: 'ตัวอย่าง ตัวอย่าง',
        acctNo: '123-123123-2',
        bankName: 'ไทยพาณิชย์',
        amount: 100,
        ischeck: false),
    AccountUser(
        acctName: 'ตัวอย่าง ตัวอย่าง',
        acctNo: '123-123123-3',
        bankName: 'ไทยพาณิชย์',
        amount: 100,
        ischeck: false),
  ];
  @override
  void initState(){
    print(fromBankName);
    print(fromAcctNo);
    print(groupName);
    print(fromAcctName);
  }
  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          appBar: func.buildAppBar(context, 'ตรวจสอบข้อมูล'),
          backgroundColor: backgroundColor,
          body: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: _height * 0.01, bottom: _height * 0.01),
                color: Colors.white,
                alignment: Alignment.center,
                child: Text(
                  groupName,
                  style: TextStyle(fontSize: _height * 0.028),
                ),
              ),
              Container(
                width: _width,
                height: _height * 0.001,
                color: Colors.grey[300],
              ),
              _buildFormData(context),
              Padding(
                padding: EdgeInsets.only(
                    left: _height * 0.02,
                    right: _height * 0.02,
                    top: _height * 0.02),
                child: Text(
                  'ผู้รับเงิน',
                  style:
                      TextStyle(fontSize: _height * 0.026, color: Colors.grey),
                ),
              ),
              _buildRecipientData(context),
              Padding(
                padding: EdgeInsets.only(
                    left: _height * 0.02,
                    right: _height * 0.02,
                    top: _height * 0.02),
                child: Text(
                  'ยอดโอนเงินทั้งหมด',
                  style:
                      TextStyle(fontSize: _height * 0.026, color: Colors.grey),
                ),
              ),
              _buildTotalAmount(context),
              SizedBox(
                height: _height * 0.02,
              ),
              _buildButtonConfirm(context)
            ],
          )),
    );
  }

  Widget _buildFormData(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(
          left: _height * 0.02, right: _height * 0.02, top: _height * 0.02),
      //alignment: Alignment.center,
      width: _width,
      height: _height * 0.12,
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'จาก',
            style: TextStyle(fontSize: _height * 0.028),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: func.checkLogoBank('กสิกรไทย'),
                  ),
                  SizedBox(
                    width: _height * 0.01,
                  ),
                  Text(
                    'ตัวอย่าง ตัวอย่าง',
                    style: TextStyle(fontSize: _height * 0.026),
                  ),
                ],
              ),
              Text(
                '666-777888-9',
                style: TextStyle(fontSize: _height * 0.026, color: Colors.grey),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildRecipientData(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        for (var data in res)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(
                    left: _height * 0.02,
                    right: _height * 0.02,
                    top: _height * 0.02),
                width: _width,
                height: _height * 0.12,
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'ไปยัง',
                      style: TextStyle(fontSize: _height * 0.028),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: func.checkLogoBank('ไทยพาณิชย์'),
                            ),
                            SizedBox(
                              width: _height * 0.01,
                            ),
                            Text(
                              'ตัวอย่าง ตัวอย่าง',
                              style: TextStyle(fontSize: _height * 0.026),
                            ),
                          ],
                        ),
                        Text(
                          '666-777888-9',
                          style: TextStyle(
                              fontSize: _height * 0.026, color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: _height * 0.001,
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                  left: _height * 0.02,
                  right: _height * 0.02,
                ),
                width: _width,
                height: _height * 0.08,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'จำนวนเงิน',
                      style: TextStyle(fontSize: _height * 0.026),
                    ),
                    Text(
                      '100.00',
                      style: TextStyle(fontSize: _height * 0.026),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: _height * 0.001,
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                  left: _height * 0.02,
                  right: _height * 0.02,
                ),
                width: _width,
                height: _height * 0.08,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'ค่าธรรมเนียม',
                      style: TextStyle(fontSize: _height * 0.026),
                    ),
                    Text(
                      '0.00',
                      style: TextStyle(fontSize: _height * 0.026),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: _height * 0.02,
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildTotalAmount(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(
        left: _height * 0.02,
        right: _height * 0.02,
      ),
      width: _width,
      height: _height * 0.24,
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'จำนวนเงินทั้งหมด',
                style: TextStyle(fontSize: _height * 0.026),
              ),
              Text(
                '300.00',
                style: TextStyle(fontSize: _height * 0.026),
              ),
            ],
          )),
          Divider(),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'ค่าธรรมเนียมทั้งหมด',
                style: TextStyle(fontSize: _height * 0.026),
              ),
              Text(
                '0.00',
                style: TextStyle(fontSize: _height * 0.026),
              ),
            ],
          )),
          Divider(),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'ยอดรวมทั้งหมดทั้งหมด',
                style: TextStyle(fontSize: _height * 0.026),
              ),
              Text(
                '300.00',
                style: TextStyle(fontSize: _height * 0.026),
              ),
            ],
          )),
        ],
      ),
    );
  }

  Widget _buildButtonConfirm(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
        left: _height * 0.02,
        right: _height * 0.02,
      ),
      child: InkWell(
        
        onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateOrderMultiTrasnferScreen(
          fromAcctNo: fromAcctNo,
          fromAcctName: fromAcctName,
          fromBankName: fromBankName,
          groupName: groupName,
        ))),
              child: Card(
          elevation: 5,
          color: backgroundMainColor,
          child: Container(
            alignment: Alignment.center,
            width: _width,
            height: _height * 0.07,
            child: Text(
              'ยืนยัน',
              style: TextStyle(fontSize: _height * 0.03, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
