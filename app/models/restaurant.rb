class Restaurant < ActiveRecord::Base
  attr_accessible :name, :location, :latitude, :longitude, :address, :phone, :postal_code, :locu_id, :website

  validates_presence_of :name, :location, :latitude, :longitude

  has_many :items
  accepts_nested_attributes_for :items

  def sort_by_percent
    @voted_items = self.items.select {|item| item.votes.count > 0}
    @unvoted_items = self.items.select {|item| item.votes.count == 0}
    @voted_items.sort_by! { |item| item.calculate_percentage }.reverse + @unvoted_items
  end

end