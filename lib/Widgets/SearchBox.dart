import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final hie, wid;

  SearchBox({@required this.hie,@required  this.wid});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: hie / 40),
      child: Center(
        child: Container(
          width: wid * (7 / 8),
          height: hie / 17,
          decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(15)
          ),
          child: Padding(padding:EdgeInsets.only(left: wid/20),
              child: Center(
                  child: SearchForm(hint: "Search...",
                    suffixIcon:Icon( Icons.search),
                    hintStyle: TextStyle(color: Colors.black45),
                    textStyle: TextStyle(color: Colors.black),)
              )
          ),
        ),
      )
      ,);
  }
}


class SearchForm extends StatelessWidget {
  final key;
  final nameOnSaved;
  final validator;
  final nameOnChange;
  final onSubmitted;
  final controller;
  final hint;
  final icon;
  final suffixIcon;
  final textStyle;
  final hintStyle;
  SearchForm({this.suffixIcon, this.key, this.nameOnSaved,this.validator,this.nameOnChange,this.onSubmitted,this.controller,this.hint,this.icon, this.textStyle, this.hintStyle});

  @override
  Widget build(BuildContext context) {
    return  SearchField(
                suffixIcon:suffixIcon,
                controller: controller,
                hei: MediaQuery.of(context).size.width/9,
                hint: hint,
                obscure: false,
                icon: icon,
                onSaved: nameOnSaved,
                hintcolor: Colors.black54,
                validator: validator,
                onChange: nameOnChange,
                onSubmitted: onSubmitted,
                color:Colors.grey.shade50,
              hintStyle: hintStyle,
              textStyle: textStyle,

    );
  }
}


class SearchField extends StatelessWidget {
  final hint;
  final obscure;
  final icon;
  final validator;
  final onSaved;
  final inputFormat;
  final keyboardType;
  final hintcolor;
  final hei;
  final onChange;
  final iconSvg;
  final borderRadius;
  final color;
  final onSubmitted;
  final controller;
  final textStyle;
  final hintStyle;
  final suffixIcon;

  SearchField(
      {this.suffixIcon,this.hint, this.obscure, this.icon, this.validator, this.onSaved, this.inputFormat, this.keyboardType, this.hintcolor, this.hei, this.onChange, this.iconSvg, this.borderRadius, this.color, this.onSubmitted, this.controller, this.textStyle, this.hintStyle});

  @override
  Widget build(BuildContext context) {
    return  Center(
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              inputFormatters: inputFormat,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: hintStyle,
// border and font style
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                // icon: icon,
                  suffixIcon: suffixIcon,
//                 suffixIcon: iconSvg,

// border:InputBorder.none,
// errorBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.red) ),
// focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueGrey) ),
              ),
              style: textStyle,
              obscureText: obscure,
              onSubmitted: onSubmitted,
              onChanged: onChange,


            ),
          ),
        );
  }
}

