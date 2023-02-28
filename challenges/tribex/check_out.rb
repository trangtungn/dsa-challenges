#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# Check out items in supermarket
class CheckOut
  attr_accessor :pricing_rules, :checked_out_items

  def initialize(rules)
    @pricing_rules = rules
    @checked_out_items = Hash.new(0)
  end

  def scan(item)
    @checked_out_items[item] += 1
  end

  def calc_total
    checked_out_items.reduce(0) do |total, (key, item_count)|
      rule = pricing_rules[key]
      next total if rule.nil?

      if item_has_offer?(rule[:special_price], rule[:number_of_items]) &&
         item_valid_for_offer?(item_count, rule[:number_of_items])

        total += (item_count / rule[:number_of_items]) * rule[:special_price]

        item_count = item_count % rule[:number_of_items]
      end

      total + item_count * rule[:price]
    end
  end

  private

  def item_has_offer?(special_price, number_of_items)
    special_price && number_of_items && number_of_items.positive?
  end

  def item_valid_for_offer?(item_count, number_of_items)
    item_count >= number_of_items
  end
end

# testing section:
# input data
pricing_rules = {
  'A' => {
    price: 50,
    special_price: 130,
    number_of_items: 0
  },
  'B' => {
    price: 30,
    special_price: 45,
    number_of_items: 2
  },
  'C' => {
    price: 20,
    number_of_items: nil
  },
  'D' => {
    price: 15,
    special_price: nil
  }
}

# run
co = CheckOut.new(pricing_rules)
# co.scan('A')
co.scan('B')
# co.scan('A')
# co.scan('A')
co.scan('D')
co.scan('B')
co.scan('C')
# co.scan('A')

# result
p co.calc_total
