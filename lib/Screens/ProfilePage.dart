import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();
  var profileData = List.generate(5, (index) => '');
  final listOfTEC = List.generate(
    5,
    (index) => TextEditingController(),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: SafeArea(
      child: new Container(
        color: Colors.white,
        child: new SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildTitleAndImage(),
              _buildTextFields(),
            ],
          ),
        ),
      ),
    ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    listOfTEC.forEach((element) {
      element.dispose();
    });
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _buildTitleAndImage() {
    return new Container(
      height: 250.0,
      color: Colors.white,
      child: new Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20.0),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 22.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: new Text('PROFILE',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            fontFamily: 'sans-serif-light',
                            color: Colors.black)),
                  )
                ],
              )),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Stack(
              fit: StackFit.loose,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                        width: 140.0,
                        height: 140.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            image: new ExactAssetImage(
                              'assets/images/as.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                        )),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 90.0, right: 100.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 25.0,
                        child: new Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTextFields() {
    return new Container(
      color: Color(0xffFFFFFF),
      child: Padding(
        padding: EdgeInsets.only(bottom: 25.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Text(
                          'Parsonal Information',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    new Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        _status ? _getEditIcon() : new Container(),
                      ],
                    )
                  ],
                )),
            _buildField(
              title: 'Name',
              hint: "Enter Your Name",
              controller: listOfTEC[0],
            ),
            _buildField(
              title: 'Email ID',
              hint: "Enter Email ID",
              controller: listOfTEC[1],
              type: TextInputType.emailAddress,
            ),
            _buildField(
              title: 'Mobile',
              hint: "Enter Mobile Number",
              controller: listOfTEC[2],
              type: TextInputType.number,
            ),
            _buildHorizontalFields(
              hintTextOne: "Enter Pin Code",
              hintTextTwo: "Enter State",
              titleOne: 'Pin Code',
              titleTwo: 'State',
              controllerOne: listOfTEC[3],
              controllerTwo: listOfTEC[4],
              inputTypeOne: TextInputType.number,
            ),
            !_status ? _getActionButtons() : new Container(),
          ],
        ),
      ),
    );
  }

  Widget _buildField({
    required String title,
    required String hint,
    required TextEditingController controller,
    TextInputType type= TextInputType.text,
  }) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Text(
                    title,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Flexible(
                  child: new TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: hint,
                    ),
                    enabled: !_status,
                    keyboardType: type,
                  ),
                ),
              ],
            )),
      ],
    );
  }

  Widget _buildHorizontalFields(
      {required String titleOne,
      required String titleTwo,
      required String hintTextOne,
      required String hintTextTwo,
      required TextEditingController controllerOne,
      required TextEditingController controllerTwo,
      TextInputType inputTypeOne = TextInputType.text,
      TextInputType inputTypeTwo = TextInputType.text,
      }) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: new Text(
                      titleOne,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: Container(
                    child: new Text(
                      titleTwo,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  flex: 2,
                ),
              ],
            )),
        Padding(
            padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: new TextField(
                      controller: controllerOne,
                      decoration: InputDecoration(hintText: hintTextOne),
                      enabled: !_status,
                      keyboardType: inputTypeOne,
                    ),
                  ),
                  flex: 2,
                ),
                Flexible(
                  child: new TextField(
                    controller: controllerTwo,
                    decoration: InputDecoration(hintText: hintTextTwo),
                    enabled: !_status,
                    keyboardType: inputTypeTwo,

                  ),
                  flex: 2,
                ),
              ],
            )),
      ],
    );
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new ElevatedButton(
                child: new Text("Save"),
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(color: Colors.white),
                  primary: Colors.green,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0)),
                ),
                onPressed: () {
                  _status = true;
                  FocusScope.of(context).requestFocus(new FocusNode());
                  profileData = listOfTEC.map((e) => e.text).toList();
                  setState(() {});
                },
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new ElevatedButton(
                child: new Text("Cancel"),
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(
                    color: Colors.white,
                  ),
                  primary: Colors.red,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0)),
                ),
                onPressed: () {
                  _status = true;
                  List.generate(listOfTEC.length,
                      (index) => listOfTEC[index].text = profileData[index]);
                  FocusScope.of(context).requestFocus(new FocusNode());
                  setState(() {});
                },
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}
