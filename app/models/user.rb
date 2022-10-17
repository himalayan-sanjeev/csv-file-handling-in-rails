class User < ApplicationRecord
  def self.to_csv
   CSV.generate do |csv|
     csv << column_names
     User.all.each do |user|
       csv << user.attributes.values_at(*column_names)
     end
   end
  end
end
