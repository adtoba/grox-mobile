import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/theme/app_colors.dart';
import 'package:grox/features/transactions/presentation/widgets/transaction_item.dart';

class RecentTransactions extends ConsumerWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Map<String, dynamic>> transactions = [
      {
        "type": "Send",
        "amount": "500 GROX",
        "date": "28-07-2026 3:42AM",
      },
      
      {
        "type": "Receive",
        "amount": "500 GROX",
        "date": "28-07-2026 3:42AM",
      },
      {
        "type": "Stake",
        "amount": "500 GROX",
        "date": "28-07-2026 3:42AM",
      },
      {
        "type": "Send",
        "amount": "500 GROX",
        "date": "28-07-2026 3:42AM",
      },
      {
        "type": "Send",
        "amount": "500 GROX",
        "date": "28-07-2026 3:42AM",
      },
      
      {
        "type": "Receive",
        "amount": "500 GROX",
        "date": "28-07-2026 3:42AM",
      },
      {
        "type": "Stake",
        "amount": "500 GROX",
        "date": "28-07-2026 3:42AM",
      },
      {
        "type": "Send",
        "amount": "500 GROX",
        "date": "28-07-2026 3:42AM",
      },
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.w),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Recent Transactions",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.grey9,
                  )
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "View all >",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primary,
                  )
                ),
              )
            ],
          ),
          ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 20.h),
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (c, i) {
              return SizedBox(height: 20.h);
            },
            itemBuilder: (c, i) {
              return TransactionItem(
                transactionType: transactions[i]["type"],
                transactionAmount: transactions[i]["amount"],
                transactionDate: transactions[i]["date"],
              );
            },
            itemCount: transactions.length,
          )
        ],
      ),
    );
  }
}