import 'package:flutter/material.dart';

class FeedsWidget extends StatelessWidget {
  const FeedsWidget({
    Key? key,
    required this.pimage,
    required this.name,
    required this.onpressed,
  }) : super(key: key);
  final String pimage;
  final String name;
  final Function() onpressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only( left: 15, right: 5),
      child: GestureDetector(
        onTap: onpressed,
        child: Container(
          height: 200,
          width: 200,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(10.0),
           color: Theme.of(context).cardColor,
         ),
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: size.height * 0.4,
                      width: double.infinity,
                      child: Image.asset(
                        pimage, // replace with your image asset path
                        fit: BoxFit
                            .cover, // adjust the image fit as per your requirement
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 17,
                    //  fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
