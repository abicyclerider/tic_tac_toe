# frozen_string_literal: true

# Module for doing set operations
module CheckSubset
  def check_subset?(list1, list2)
    list2.all? { |element| list1.include?(element) }
  end

  def check_subsets?(list, list_of_lists)
    list_of_lists.any? { |list_element| check_subset?(list, list_element) }
  end
end
