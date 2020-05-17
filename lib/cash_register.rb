class CashRegister
  attr_accessor :total, :discount, :price, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item, price, quantity = 1)
    @total += price * quantity
    @last_transaction = {
      name: item,
      price: price,
      quantity: quantity
    }
    quantity.times do
      @items << item
    end
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      @total *= (1 - (@discount.to_f / 100.0))
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def void_last_transaction
    @total -= @last_transaction[:price] * @last_transaction[:quantity]
    @last_transaction[:quantity].times do
      @items.pop
    end
    @total = 0 if @items.size  == 0
  end

end
