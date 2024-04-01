import 'package:flutter/material.dart';


Container reusableButton({required BuildContext context, required String btnText,  required Function onTap, BorderSide? side, Color? txtColor, Color? bgColor }){
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 60,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed:(){
        onTap();
      },
        style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states){
        if(states.contains(MaterialState.pressed)){
          return Colors.black26;
  }
        return bgColor;
  }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: side ?? const BorderSide(color: Colors.grey),
          ))
    ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          btnText,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: txtColor),

        ),
      ),
    )
  );
}