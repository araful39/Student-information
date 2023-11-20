import 'package:flutter/material.dart';

import 'Model/student_information.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _nameControllar = TextEditingController();
  TextEditingController _inistituteControllar = TextEditingController();
  TextEditingController _depControllar = TextEditingController();
  TextEditingController _rollControllar = TextEditingController();
  // TextEditingController _yearControllar = TextEditingController();

  List<StudentInformation> jstudents = [];
  List<StudentInformation> myStudents = [];

  String selectedOption="2023";

  List<String> options = [
    "2020",
    "2021",
    "2022",
    "2023",
    "2024",
    "2025",
    "2026",
    "2027",
    "2028",
    "2029",
    "2030"
  ];

 void data() {
   jstudents.add(
      StudentInformation(
          name: _nameControllar.text,
          inistitute: _inistituteControllar.text,
          dep: _depControllar.text,
          roll: _rollControllar.text,
          year: selectedOption.toString()),
    );

    _nameControllar.clear();
    _inistituteControllar.clear();
    _depControllar.clear();
    _rollControllar.clear();
    selectedOption;
  }

  TextEditingController _searchControllar = TextEditingController();
  void searchUser() {
    myStudents = jstudents
        .where((element) =>
            element.name.toLowerCase().contains(_searchControllar.text.toString().toLowerCase()))
        .toList();

  }
  @override
  void initState() {

   jstudents=myStudents;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Model"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: _searchControllar,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: () {
                      searchUser();
                      print("----sara---");
                      setState(() {

                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    )),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: w / 2,
                      child: TextField(
                        controller: _nameControllar,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2)),
                            labelText: "Name"),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: w / 3,
                      child: TextField(
                        controller: _inistituteControllar,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2)),
                            labelText: "Inistitute Name"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: w / 3,
                      child: TextField(
                        controller: _depControllar,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2)),
                            labelText: "Depertment "),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: w / 3,
                      child: TextField(
                        controller: _rollControllar,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2)),
                            labelText: "Roll"),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 150,
                        child: DropdownButton<String>(
                          menuMaxHeight: 200,
                          hint: Text(selectedOption.toString()),
                          value: selectedOption,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedOption = newValue.toString()!;
                            });
                          },
                          items: options
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              onTap: () {},
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      )),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {

                if (_nameControllar.text.toString().isNotEmpty &&
                        _inistituteControllar.text.toString().isNotEmpty &&
                        _depControllar.text.toString().isNotEmpty &&
                        _rollControllar.text.toString().isNotEmpty ||
                   selectedOption.toString().isNotEmpty) {
                  setState(() {
                    data();
                  });
                } else {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            content: Text("Fill in the all gaps"));
                      });
                }

                myStudents=jstudents;
              },
              child: Text("Ok")),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: myStudents.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Name: ${myStudents[index].name.toString()}",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Inistitute Name: ${myStudents[index].inistitute.toString()}",
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                    "Depertment : ${myStudents[index].dep.toString()}"),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                    "Roll : ${myStudents[index].roll.toString()}"),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Year: ${myStudents[index].year.toString()}",
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
