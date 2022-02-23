import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/model/kategori_model.dart';
import 'package:flutter_application_1/view/bolge_icerikler.dart';
import 'package:flutter_application_1/viewmodel/get_kategori.dart';

class KategoriPage extends StatefulWidget {
  const KategoriPage({Key? key}) : super(key: key);

  @override
  State<KategoriPage> createState() => _KategoriPageState();
}

//DocumentSnapshot<Map<String, dynamic>> doc;
class _KategoriPageState extends State<KategoriPage> {
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
        body: StreamBuilder<List<Kategori>>(
          stream: getKategori(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: Text(
                  "Veri Yok",
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Bir hata gerçekleşti."),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Kategori currentModel = snapshot.data![index];
                  //print(snapshot.data![index]);
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 30.0, top: 20.0),
                    child: SizedBox(
                      height: 100.h,
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.w)),
                          color: Color((math.Random().nextDouble() * 0xFFFFFF)
                                  .toInt())
                              .withOpacity(0.2),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BolgeIcerik(index)));
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 40.w,
                                ),
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      currentModel.imgUrl.toString(),
                                      width: 70.w,
                                      height: 70.h,
                                    )),
                                SizedBox(
                                  width: 60.w,
                                ),
                                Text(
                                  currentModel.name.toString(),
                                  style: TextStyle(
                                      fontSize: 34.r,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          )),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text("An Error occured"));
            }
          },
        ));
  }
}
/*
 ListTile(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>BolgeIcerik(index)));
                          },
                          leading: Image.network(currentModel.imgUrl.toString(),width: 70.w,height: 70.h,color: Colors.lightBlue,),
                          title: Align(alignment: Alignment.center,child: Text(currentModel.name.toString(),style: TextStyle(fontSize: 34.r,fontWeight: FontWeight.bold),)),
                        ),
 */
