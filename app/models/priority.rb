class Priority < ApplicationRecord
  belongs_to :user
  belongs_to :tag

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

end
