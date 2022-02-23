import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/model/bolge_icerik_model.dart';
import 'package:flutter_application_1/view/bolge_icerikleri_detay.dart';
import 'package:flutter_application_1/viewmodel/get_bolge_icerikleri.dart';

class BolgeIcerik extends StatefulWidget {
  BolgeIcerik(this.index, {Key? key}) : super(key: key);
  int index;

  @override
  State<BolgeIcerik> createState() => _BolgeIcerikState();
}

class _BolgeIcerikState extends State<BolgeIcerik> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {},
          )
        ],
      ),
      body: StreamBuilder<List<BolgeIcerikModel>>(
        stream: getBolgeIcerikler(widget.index),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text("No Data"),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("An Error Occured"),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                BolgeIcerikModel currentModel = snapshot.data![index];
                //print(snapshot.data![index]);
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 30.0, right: 30.0, top: 25.0),
                  child: SizedBox(
                    height: 370.h,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 800.h,
                              color: Colors.white,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    locationButtons(
                                        context, index, currentModel)
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Card(
                          color: Colors.grey.shade400,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.network(
                                currentModel.imgUrl.toString(),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                currentModel.name.toString(),
                                style: TextStyle(
                                    fontSize: 34.r,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text("An Error occured"));
          }
        },
      ),
    );
  }

  Padding locationButtons(
      BuildContext context, int index, BolgeIcerikModel currentModel) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.mode),
                    iconSize: 60,
                  ),
                  Text(
                    "Detaylar",
                    style: TextStyle(fontSize: 28.r),
                  )
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.map),
                    iconSize: 60,
                  ),
                  Text(
                    "Detaylar",
                    style: TextStyle(fontSize: 28.r),
                  )
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.circle),
                    iconSize: 60,
                  ),
                  Text(
                    "Detaylar",
                    style: TextStyle(fontSize: 28.r),
                  )
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios),
                    iconSize: 60,
                  ),
                  Text(
                    "Detaylar",
                    style: TextStyle(fontSize: 28.r),
                  )
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.laptop_chromebook_rounded),
                    iconSize: 60,
                  ),
                  Text(
                    "Detaylar",
                    style: TextStyle(fontSize: 28.r),
                  )
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.near_me),
                    iconSize: 60,
                  ),
                  Text(
                    "Detaylar",
                    style: TextStyle(fontSize: 28.r),
                  )
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add_location_sharp),
                    iconSize: 60,
                  ),
                  Text(
                    "Detaylar",
                    style: TextStyle(fontSize: 28.r),
                  )
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.airline_seat_recline_normal_outlined),
                    iconSize: 60,
                  ),
                  Text(
                    "Detaylar",
                    style: TextStyle(fontSize: 28.r),
                  )
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BolgeIcerikDetay(
                                  index,
                                  currentModel.comment.toString(),
                                  currentModel.youtubeId.toString(),
                                  currentModel.lat.toString(),
                                  currentModel.lon.toString())));
                    },
                    icon: Icon(Icons.details),
                    iconSize: 60,
                  ),
                  Text(
                    "Detaylar",
                    style: TextStyle(fontSize: 28.r),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

getSmallContainer() {
  return Center(
    child: Container(
      color: Colors.white,
      height: 30.h,
      width: 30.w,
      child: Icon(
        Icons.add,
        size: 20.r,
      ),
    ),
  );
}
