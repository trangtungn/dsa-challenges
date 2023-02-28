class Solution {
  public int[] twoSum(int[] nums, int target) {
    if (nums.length == 1) {
      return new int[] { 0 };
    }

    if (nums.length == 2 && nums[0] + nums[1] == target) {
      return new int[] { 0, 1 };
    }

    for (int i = 0; i < nums.length - 1; i++) {
      for (int j = i + 1; j < nums.length; j++) {
        if (nums[i] + nums[j] == target) {
          return new int[] { i, j };
        }

        if (nums[nums.length - i - 1] + nums[nums.length - j - 1] == target) {
          return new int[] { nums.length - i - 1, nums.length - j - 1 };
        }
      }
    }

    return null;
  }
}
