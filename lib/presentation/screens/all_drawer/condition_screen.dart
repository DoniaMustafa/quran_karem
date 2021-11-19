import 'package:flutter/material.dart';
import 'package:quran_karem/constants/styel.dart';
import 'package:quran_karem/constants/url.dart';
import 'package:quran_karem/presentation/widget/frame_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ConditionScreen extends StatelessWidget {
  void lunchUrl()async{
    await launch(islamicUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        child: customFrame(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  padding: EdgeInsets.only(top: 40.0,left: 30.0),
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                      onTap: ()=>Navigator.pop(context),
                      child: Icon(Icons.arrow_back_ios_outlined))),
              SizedBox(

                height: 75,
              ),
              Expanded(child: SingleChildScrollView(
                child:Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Text('الأحكام والشروط',style: white22bold(),),
                      SizedBox(height: 50,),
                      Row(
                        children: [
                          Text('AlQuran.cloud is part of the',style: white16regular(),textAlign:TextAlign.start ,textScaleFactor:1.0,),
                          GestureDetector(
                              onTap: ()=>lunchUrl(),
                              child: Text(' Islamic Network',style: blue16regular(),textAlign:TextAlign.start )),

                        ],
                      ),
                      SizedBox(height:0.5,),

                      RichText(
                        textScaleFactor:1.1,
                        text: TextSpan(
                            style: white16regular(),
                          text:'This website, API and all the services herein are made available in the hope that they will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. '

                              'The Quran text and audio provided has been originally retrieved from GlobalQuran.com. '

                              'All audio files used on this website and third party libraries own and retain their respective copyrights.'
                        ),

                      )
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
