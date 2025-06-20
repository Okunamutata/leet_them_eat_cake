part of 'all_problems.dart';

/// in the event where a `.toSet()` is not available, this can be accomplished by
/// 1. looping through the input list
/// 2. Because we are looking for duplicates the best we can get here in O(n)
/// 3. Create a map where the key is the current value of your iteration
/// 4. After iterating through `input`, compare the length of the map & the input.
/// 5. if they are the same, theres no dupe, otherwise there is a dupe
bool containsDupe(List<int> input) => input.toSet().length != input.length;
