import 'package:args/args.dart';

import 'problem_set/all_problems.dart';

void handleFlag(ArgResults results) async {
  for (final Problem problem in Problem.values) {
    if (results.flag(problem.flag)) {
      switch (problem) {
        case Problem.twoSum:
          {
            if (results.rest.length < 2) {
              throw FormatException(
                'Missing arguments. \n $problem requires a list of num, and a target sum number; ie: ["[3,2,4]","6"]',
              );
            }

            final List<int> numbers = strToIntList(results.rest.first);
            final int target = int.parse(results.rest.last);
            final List<int> result = twoSum(numbers: numbers, target: target);
            print(
              'Two Sum Completed w/ target of $target and result of $result',
            );
          }
        case Problem.maxProfit:
          {
            if (results.rest.isEmpty) {
              throw FormatException(
                'Missing arguments. \n $problem requires a list of numbers, ie: ["[3,2,4]"]',
              );
            }

            final List<int> numbers = strToIntList(results.rest.first);

            // results.rest.first
            //     .replaceAll('[', '')
            //     .replaceAll(']', '')
            //     .trim()
            //     .split(',')
            //     .map((String num) => int.parse(num))
            //     .toList(growable: false);

            final int result = maxProfits(numbers);
            print('Max profits calculated w/ result of \$$result');
          }
        case Problem.containsDuplicate:
          {
            if (results.rest.isEmpty) {
              throw FormatException(
                'Missing arguments. \n $problem requires a list of numbers, ie: ["[3,2,4]"]',
              );
            }

            final List<int> numbers = strToIntList(results.rest.first);

            final bool result = containsDupe(numbers);
            print('Contains Dupe on $numbers w/ result of $result');
          }
      }
      break;
    }
  }
}

List<int> strToIntList(String input) => input
    .replaceAll('[', '')
    .replaceAll(']', '')
    .trim()
    .split(',')
    .map((String num) => int.parse(num))
    .toList(growable: false);
