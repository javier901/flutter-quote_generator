import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/config/theme/dimensions.dart';
import 'package:quote_generator/presentation/presentation.dart';
import 'package:quote_generator/translations/l10n.dart';

class CreateQuoteScreen extends ConsumerWidget {
  static CreateQuoteScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const CreateQuoteScreen();
  const CreateQuoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {
                _saveQuoteInDB(ref, context);
              },
              child: Text(
                context.l10n.done.toUpperCase(),
                style: textTheme.titleLarge?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: Dimensions.kPaddingSymetricHorizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                context.l10n.create_your_quote,
                style: textTheme.displayMedium,
              ),
              const QuoteTextField(),
              const DisplayTextSettings(),
              const BackgroundColorPicker(),
              Dimensions.kVerticalSpaceLargest
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _saveQuoteInDB(WidgetRef ref, BuildContext ctx) async {
    FocusManager.instance.primaryFocus?.unfocus();
    await ref.read(quoteProvider.notifier).addQuote().then((value) {
      ctx.pop();
    });
  }
}
