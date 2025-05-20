# frozen_string_literal: true

# Module for doing set operations
module CheckSubset
  def check_subset?(list1, list2)
    list2.all? { |element| list1.include?(element) }
  end

  def any_subset_in_list?(list, list_of_lists)
    list_of_lists.any? { |list_element| check_subset?(list, list_element) }
  end
end
