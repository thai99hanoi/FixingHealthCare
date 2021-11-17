import 'package:flutter/material.dart';
import 'package:heath_care/model/district.dart';
import 'package:heath_care/model/province.dart';

import 'components/NavSideBar.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  List<Province> provinces = [
    Province(provinceId: 0, name: 'HCM', isActive: 1),
    Province(provinceId: 1, name: 'HN', isActive: 1),
    Province(provinceId: 2, name: 'Đồng Nai', isActive: 1),
    Province(provinceId: 3, name: 'Bình Dương', isActive: 1),
    Province(provinceId: 4, name: 'Long An', isActive: 0)
  ];

  Province? selectedProvince;
  List<District> districts = [];
  District? selectedDistrict;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(78, 159, 193, 1),
          title: Text("HỒ SƠ"),
        ),
        body: Column(
          children: [
            DropdownButton<Province>(
              hint: Text(selectedProvince?.name ?? 'vui lòng chọn'),
              items: provinces.map((Province province) {
                return DropdownMenuItem<Province>(
                  value: province,
                  child: Text(province.name!),
                );
              }).toList(),
              onChanged: (province) {
                print(province!.provinceId);
                //có provinceId call api
                //lúc này ta có lis district
                //rebuild lại page này, sẽ hiện dropdown district vì length lúc này >0
                setState(() {
                  selectedProvince = province;
                  districts = [
                    District(
                        districtId: 0,
                        name: 'quan 1',
                        province:
                            Province(provinceId: 0, name: 'HCM', isActive: 1),
                        isActive: 1),
                    District(
                        districtId: 1,
                        name: 'quan 2',
                        province:
                            Province(provinceId: 0, name: 'HCM', isActive: 1),
                        isActive: 1),
                    District(
                        districtId: 2,
                        name: 'quan 3',
                        province:
                            Province(provinceId: 0, name: 'HCM', isActive: 1),
                        isActive: 1),
                    District(
                        districtId: 3,
                        name: 'quan 4',
                        province:
                            Province(provinceId: 0, name: 'HCM', isActive: 1),
                        isActive: 1),
                  ];
                });
              },
            ),
            if (districts.length > 0)
              DropdownButton<District>(
                hint: Text(selectedDistrict?.name ?? 'vui lòng chọn'),
                items: districts.map((District district) {
                  return DropdownMenuItem<District>(
                    value: district,
                    child: Text(district.name!),
                  );
                }).toList(),
                onChanged: (district) {
                  print(district!.districtId);
                  setState(() {
                    selectedDistrict = district;
                  });
                  //tượng tự có districtId, làm tiếp
                },
              )
          ],
        ),
        drawer: NavDrawer());
  }
}
