import 'package:contact_list/src/homepage/contact_type.dart';
import 'package:flutter/material.dart';

class ContactHelper {
  static Icon getIconByContactType(ContactType type) {
    switch (type) {
      case ContactType.PHONE:
        return Icon(
          Icons.phone_android,
          color: Colors.green[700],
        );
      case ContactType.WORK:
        return Icon(
          Icons.work,
          color: Colors.brown[600],
        );
      case ContactType.FAVORITE:
        return Icon(
          Icons.star,
          color: Colors.yellow[600],
        );
      case ContactType.HOME:
        return Icon(
          Icons.home,
          color: Colors.purple[600],
        );
    }
  }
}
