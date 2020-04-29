class Adminstudrec < ApplicationRecord
=begin
     def self.import(file)
        begin
            file_ext = File.extname(file.original_filename)
            raise "Unknown file type: #{file.original_filename}" unless [".xls", ".xlsx"].include?(file_ext)
            spreadsheet = (file_ext == ".xls") ? Roo::Excel.new(file.path) : Roo::Excelx.new(file.path)
            puts "byee"
            ## We are iterating from row 2 because we have left row one for header
            (2..spreadsheet.last_row).each do |i|
              Adminstudrec.create(name: spreadsheet.row(i)[0], uin: spreadsheet.row(i)[1], email: spreadsheet.row(i)[2], classcode: spreadsheet.row(i)[3], major: spreadsheet.row(i)[4] )
            end
            
        end
    end
=end    
end
