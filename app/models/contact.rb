class Contact < ActiveRecord::Base
	has_no_table
	column :name, :string
	column :email, :string
	column :content, :string

	validates_presence_of :name
	validates_presence_of :email
	validates_presence_of :content
	validates_length_of :content, :maximum => 500
end