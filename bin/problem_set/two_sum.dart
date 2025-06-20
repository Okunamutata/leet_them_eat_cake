/*
Two Sum
  Given an array of integers nums and an integer target,
    return indices of the two numbers such that they add up to target.
  You may assume that each input would have exactly one solution,
    and you may not use the same element twice.
  You can return the answer in any order.
Example 1:
Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Output: Because nums[0] + nums[1] == 9, we return [0, 1].
Example 2:
Input: nums = [3,2,4], target = 6
Output: [1,2]
Example 3:
Input: nums = [3,3], target = 6
Output: [0,1]
Constraints:
2 <= nums.length <= 104
-109 <= nums[i] <= 109
-109 <= target <= 109
Only one valid answer exists.*/

part of 'all_problems.dart';

List<int> twoSum({required List<int> numbers, required int target}) {
  if (numbers.isEmpty || numbers.length < 2) return <int>[];

  print('Running _bruteForce TwoSum on $numbers w/ target $target');
  Map<int, int> record = <int, int>{};
  int? tempIdx1, tempIdx2;
  int sum = 0;
  for (int i = 0; i < numbers.length; i++) {
    print('Iteration $i: \n$record');
    if (sum == target) break;
    final int current = numbers[i];
    sum += current;
    if (record.containsKey(target - current)) {
      tempIdx1 = record[target - current]!;
      tempIdx2 = i;
      return <int>[tempIdx1, tempIdx2];
    }
    record[current] = i;
  }
  return <int>[];
}
