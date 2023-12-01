import 'package:flutter/material.dart';

import '../../common/constants.dart';
import '../../services/base_services.dart';
import 'dokan.dart';
import 'services/dokan_service.dart';

mixin VendorListingMixin {
  Widget renderVendorOrderForDokan(
          BuildContext context, SettingItemStyle? cardStyle) =>
      DokanWidget().renderVendorOrder(context, cardStyle);

  BaseServices? buildDokanService({
    required String domain,
    String? blogDomain,
    String? consumerSecret,
    String? consumerKey,
  }) =>
      DokanService(
        domain: domain,
        blogDomain: blogDomain,
        consumerSecret: consumerSecret ?? '',
        consumerKey: consumerKey ?? '',
      );
}
