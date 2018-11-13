class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :orders
  has_many :carted_vendors, through: :orders
  
  has_many :reviews
  has_many :bookings
  has_many :vendors, through: :bookings

  # has_many :priorities
  # has_many :tags, through: :priorities

  has_many :vendors


  def merchant?
    vendors.any?
  end

  def customer?
    vendors.none?
  end

  def shopping_cart
    carted_vendors.where(status: "carted")
  end

  def priorities
    Priority.where(user_id: id)
  end

  def tags
    priorities.map {|priority| priority.tag }
  end

  # finds all priority objects and makes a hash of priorities
  def priorities_hash
    priorities.map { |priority_object| [priority_object.tag.name, priority_object.percentage] }.to_h
  end

  def new_key(hash_1, hash_2)
    differences = hash_2.keys - hash_1.keys
    if differences.any?
     {changed: differences.first, from: 0, to: hash_2[differences.first]}
    end
  end

  def removed_key(hash_1, hash_2)
    differences = hash_1.keys - hash_2.keys
    if differences.any?
      {changed: differences.first, from: hash_1[differences.first], to: 0}
    end
  end

  def changed_key(hash_1, hash_2)
    if hash_1.length == hash_2.length
      hash_1.each do |key, value|
        if hash_1[key] != hash_2[key] 
          return {changed: key, from: hash_1[key], to: hash_2[key]}    
        end
      end
    end
  end

  def total_change(hash_1, hash_2)
    changed_value = new_key(hash_1, hash_2) || removed_key(hash_1, hash_2) || changed_key(hash_1, hash_2) 
    puts "=" * 50
    puts "=" * 50
    p changed_value
    puts "=" * 50
    puts "=" * 50
    original_percentages = hash_2.map {|key, value| [key, nil]}.to_h

    old_leftover = 100 - changed_value[:from]
    hash_1.each do |key, value|
      unless key == changed_value[:changed]
        original_percentages[key] = value.to_f / old_leftover.to_f
      end
    end

    new_leftover = 100 - changed_value[:to]
    hash_2.each do |key, value|
      unless key == changed_value[:changed]
        hash_2[key] = original_percentages[key] * new_leftover.to_f
      end
    end

    hash_2
  end

  def budget_out(budget, percent_hash)
    percent_hash.map {|specialty_tag, percentage_allotted| [specialty_tag, self.budget * percentage_allotted / 100] }.to_h
  end

  # Finds vendors within the price limit

  def vendors_within_budget(priority)
    money_to_spend_on_this_speciality = priority.percentage * budget 
    vendors_with_tag = Tag.find(priority.tag_id).vendors
    vendors_with_tag.select { |vendor| vendor.price <= money_to_spend_on_this_speciality }
  end

  # def formatted_vendors_within_budget(priority)
  #   services_within_budget(priority)
  # end

end
