import 'dart:math' as math;

part 'contains_dupe.dart';
part 'max_profit.dart';
part 'two_sum.dart';

enum Problem {
  twoSum('two_sum', 't', 'Run two-sum, pg.2 of problem pdf'),
  maxProfit('max_profit', 'm', 'Run max-profit, pg.4 of problem pdf'),
  containsDuplicate(
    'dupe_in_array',
    'd',
    'Run dupe_in_array, pg.5 of problem pdf',
  );

  final String flag, help, abbr;

  const Problem(this.flag, this.abbr, this.help);
}

Problem? flagToProblem(String name) {
  switch (name) {
    case 'two_sum':
      return Problem.twoSum;
  }
  return null;
}
