require "spec_helper"
require "walmart_open/order_item"

describe WalmartOpen::OrderItem do
  context ".new" do
    it "sets value correctly" do
      item_id = 10371356
      item_price = 1.23
      item_shipping_price = 2.20
      order_item = WalmartOpen::OrderItem.new(item_id, 1, item_price, item_shipping_price)

      expect(order_item.item_id).to eq(item_id)
      expect(order_item.quantity).to eq(1)
      expect(order_item.item_price).to eq(item_price)
      expect(order_item.shipping_price).to eq(item_shipping_price)
      expect(order_item).to be_valid
    end

    context "#valid?" do
      context "when required field are present" do
        it "returns true" do
          item_id = 10371356
          order_item = WalmartOpen::OrderItem.new(item_id, 1)

          expect(order_item.item_id).to eq(item_id)
          expect(order_item.quantity).to eq(1)
          expect(order_item).to be_valid
        end
      end

      context "when required field are not present" do
        it "returns false" do
          item_id = nil
          order_item = WalmartOpen::OrderItem.new(item_id, 1)

          expect(order_item.item_id).to eq(item_id)
          expect(order_item.quantity).to eq(1)
          expect(order_item).not_to be_valid
        end
      end
    end
  end
end
