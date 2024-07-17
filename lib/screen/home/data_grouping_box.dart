import 'package:flutter/material.dart';

import '../../services/info_service.dart';
import '../../model/info_model.dart';
import '../../services/info_detail_service.dart';
import '../../model/info_detail_model.dart';

class DataGroupingBox extends StatefulWidget {
  final String title;

  DataGroupingBox({required this.title});

  @override
  _DataGroupingBoxState createState() => _DataGroupingBoxState();
}

class _DataGroupingBoxState extends State<DataGroupingBox> {
  String? _imageUrl;
  List<Info> _infos = [];
  String? _address;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData(widget.title);
  }

  void _fetchData(String title) async {
    try {
      List<Info> infos = await InfoService.fetchInfos(query: title);
      Map<String, List<Info>> addressGroups = {};

      for (Info item in infos) {
        final InfoDetail detail = await InfoDetailService.fetchInfoDetail(item);
        final address = detail.ccbaLcad;
        item.imageUrl = detail.imageUrl.isNotEmpty ? detail.imageUrl : null;

        if (addressGroups.containsKey(address)) {
          addressGroups[address]!.add(item); // null safety 필요
        } else {
          addressGroups[address] = [item];
        }
      }

      String mostCommonAddr = '';
      List<Info> group = [];
      addressGroups.forEach((addr, data) {
        if (data.length > group.length) {
          group = data;
          mostCommonAddr = addr;
        }
      });

      if (group.isNotEmpty) {
        setState(() {
          _infos = group;
          _address = mostCommonAddr;
          _imageUrl = group[0].imageUrl;
          _isLoading = false;
          // print(_imageUrl);
        });
      }
    } catch (e) {
      print('_fetchData error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width * 0.4;
    double containerHeight = MediaQuery.of(context).size.height * 0.25;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: containerWidth,
          height: containerHeight*0.85,
          // child : Image.asset(imgUrl[idx], fit: BoxFit.contain)
          child: _isLoading
              ? Center(child: CircularProgressIndicator()) // 로딩 중
              : _imageUrl == null
              ? Center(child: Text('No Image')) // 이미지 없음
              : Image.network( // 이미지 있음
            _imageUrl!,
              fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: containerWidth,
          child: Text(
            widget.title,
            style: TextStyle(fontSize: 16.0),
            overflow: TextOverflow.ellipsis, // 텍스트 넘어가면 ...으로 표시
          ),
        )
      ],
    );
  }
}
