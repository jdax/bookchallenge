class Book < ActiveRecord::Base
  belongs_to :user
  has_many :shoutout_values
  has_many :values, through: :shoutout_values

  # superlatives is values
  def superlatives=(ids)
    ids.reject! { |id| id.blank? }
    shoutout_values.each do |shoutout_value |
      ids.reject! do |id|
        id.to_i==shoutout_value.value_id
      end
    end
    ids.each do |id|
      shoutout_values.build value_id: id
    end
  end

  def superlatives
    shoutout_values.map(&:value_id)
  end

end
