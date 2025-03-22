import 'package:biyung/core/constant.dart';
import 'package:biyung/core/route/router.dart';
import 'package:flutter/material.dart';

class CommonUtils{

  showMessage(String str) {
    ScaffoldMessenger.of(rNavKey.currentContext!)
        .showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: gap * 2),
        closeIconColor: Colors.white,
        showCloseIcon: true,
        content: Text(
          str,
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
        ),
      ),
    );
  }
}