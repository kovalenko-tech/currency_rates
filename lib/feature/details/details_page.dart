import 'package:currency_rates/common/common.dart';
import 'package:currency_rates/generated/app_strings.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/details_cubit.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    required this.flag,
    required this.currencyKey,
    super.key,
  });

  final String flag;
  final String currencyKey;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DetailsCubit>()..init(key: currencyKey),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            LocaleKeys.details_title.tr(namedArgs: {
              'flag': flag,
            }),
            style: context.textTheme.title,
          ),
        ),
        body: BlocBuilder<DetailsCubit, DetailsState>(
          builder: (context, state) {
            return state.maybeWhen(
              success: (currencies) => ListView.separated(
                padding: EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  final currency = currencies[index];

                  return CurrencyCard(
                    exchange: currency.exchange,
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 16),
                itemCount: currencies.length,
              ),
              orElse: () => Center(child: LoadingIndicator()),
            );
          },
        ),
      ),
    );
  }
}
