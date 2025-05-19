# frozen_string_literal: true

module CheckSubset
  def check_subset?(list_1, list_2)
    list_2.all? { |element| list_1.include?(element) }
  end

  def check_subsets?(list, list_of_lists)
    list_of_lists.any? { |list_element| check_subset?(list, list_element) }
  end
end
