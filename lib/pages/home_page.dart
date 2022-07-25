import 'package:flutter/material.dart';
import 'package:pdp_network/model/post_model.dart';
import 'package:pdp_network/services/network_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? data;

  void _apiEmployees() {
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) {
      showData(response);
    });
  }

  void _apiEmployee(Employee employee) {
    Network.GET(Network.API_EMPLOYEE_BY_ID + employee.id.toString(), Network.paramsEmpty()).then((response) {
      showData(response);
    });
  }

  void _apiCreateEmployee(Employee employee) {
    Network.POST(Network.API_CREATE, Network.paramsCreate(employee)).then((response) {
      showData(response);
    });
  }

  void _apiUpdateEmployee(Employee employee) {
    Network.PUT(Network.API_UPDATE + employee.id.toString(), Network.paramsCreate(employee)).then((response) {
      showData(response);
    });
  }

  void _apiDeleteEmployee(Employee employee) {
    Network.PUT(Network.API_DELETE + employee.id.toString(), Network.paramsEmpty()).then((response) {
      showData(response);
    });
  }

  void showData(String? res) {
    setState(() {
      data = res;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Employee employee =
        Employee(id: 1, employee_age: 17, employee_name: "Samandar", employee_salary: 100, profile_image: '');
    _apiEmployee(employee);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data ?? 'No Data'),
      ),
    );
  }
}
