require_relative 'lib/csv_processor'
require 'benchmark'

Benchmark.bm do |x|
  x.report {
    csv_processor = CSVProcessor.new('data/generated_codes.csv')
    csv_processor.sql_file('data/codes.sql')
  }
end
