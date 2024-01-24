import 'package:currency_rates/common/common.dart';
import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  const CurrencyCard({
    required this.exchange,
    this.name,
    this.flag,
    this.onPressed,
    super.key,
  });

  final String? name;
  final String? flag;
  final double exchange;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(),
        ),
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (flag != null)
              Text(
                flag!,
                style: context.textTheme.header,
              ),
            if (name != null)
              Text(
                name!,
                style: context.textTheme.title,
              ),
            Text(
              exchange.toString(),
              style: context.textTheme.label,
            ),
          ],
        ),
      ),
    );
  }
}
