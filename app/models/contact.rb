class Contact < ActiveRecord::Base
	has_no_table
	column :name, :string
	column :email, :string
	column :content, :string

	validates_presence_of :name
	validates_presence_of :email
	validates_presence_of :content
	validates_length_of :content, :maximum => 500

	#save to google drive
	def update_spreadsheet
		connection = GoogleDrive.login(ENV["GMAIL_USERNAME"], ENV["GMAIL_PASSWORD"])
		ss = connection.spreadsheet_by_title('Learn-Rails-Example')
		if ss.nil?
			ss = connection.create_spreadsheet('Learn-Rails-Example')
		end
		ws = ss.worksheets[0]
    last_row = 1 + ws.num_rows
		ws[last_row, 1] = Time.new
		ws[last_row, 2] = self.name
		ws[last_row, 3] = self.email
		ws[last_row, 4] = self.content
		ws.save
	end

end
