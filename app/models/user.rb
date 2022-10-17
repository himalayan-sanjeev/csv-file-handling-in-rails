class User < ApplicationRecord

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      User.all.each do |user|
        csv << user.attributes.values_at(*column_names)
      end
    end
   end
  
  def self.import(file)
    CSV.foreach(file.path, headers: true, col_sep: ",") do |row|
      User.create! row.to_hash
    end
  end
end
