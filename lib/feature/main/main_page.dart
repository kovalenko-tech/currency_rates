import 'package:currency_rates/common/common.dart';
import 'package:currency_rates/generated/app_strings.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/main_cubit.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    required this.onCurrencyDetails,
    super.key,
  });

  final void Function(String, String) onCurrencyDetails;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _durationTextController = TextEditingController();
  final _durationFucusNode = FocusNode();

  @override
  void dispose() {
    _durationTextController.dispose();
    _durationFucusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MainCubit>()..init(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            LocaleKeys.main_title.tr(),
            style: context.textTheme.title,
          ),
        ),
        body: BlocConsumer<MainCubit, MainState>(
          listener: (context, state) {
            if (state.currencies.isNotEmpty && _durationTextController.text.isEmpty && !_durationFucusNode.hasFocus) {
              _durationTextController.text = state.refreshDuration.inSeconds.toString();
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          focusNode: _durationFucusNode,
                          controller: _durationTextController,
                          keyboardType: TextInputType.number,
                          decoration:
                              InputDecoration(hintText: '0', labelText: LocaleKeys.main_text_field_duration_title.tr()),
                          onChanged: (value) => context.read<MainCubit>().updateDuration(
                                duration: Duration(
                                  seconds: int.parse(value),
                                ),
                              ),
                          onTapOutside: (event) => FocusScope.of(context).requestFocus(FocusNode()),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: state.currencies.isEmpty
                        ? Center(
                            child: LoadingIndicator(),
                          )
                        : ListView.separated(
                            itemBuilder: (context, index) {
                              final currency = state.currencies[index];

                              return CurrencyCard(
                                name: currency.name,
                                flag: currency.flag,
                                exchange: currency.exchange,
                                onPressed: () => widget.onCurrencyDetails(currency.key, currency.flag),
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(height: 16),
                            itemCount: state.currencies.length,
                          ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
