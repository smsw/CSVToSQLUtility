require 'csv'

class CSVProcessor
  attr_accessor :file, :sqlfile, :sql_write_file

  def initialize(file)
    @file = file
  end

  def codes
    arr = []
    CSV.foreach(file, headers: false) { |row| arr.push row.first }
    arr
  end

  def sql_file(sqlfile)
    @sqlfile = sqlfile
    File.open(sqlfile, 'w+') do |sql_write_file|
      sql_write_to_file(sql_write_file)
    end
  end

  private
  def sql_write_to_file(file)
    @sql_write_file = file
    sql_write_start
    sql_write_codes
    sql_write_end
  end

  def sql_write_start
    sql_write_file.write("INSERT INTO 'codes' ('code') VALUES\n")
  end

  def sql_write_codes
    i = 0
    cnt = codes.count - 1
    codes.each do |code|
      comma = ',' if i != cnt
      sql_write_file.write("('#{code}')#{comma}\n")
      i += 1
    end
  end

  def sql_write_end
    sql_write_file.write(';')
  end
end
