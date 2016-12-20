require 'csv_processor'

RSpec.describe CSVProcessor do
  let(:csv_processor) { CSVProcessor.new('spec/test.csv') }

  it 'should create an instance of CSVProcessor' do
    expect(csv_processor).to be_a CSVProcessor
  end

  it 'should have file path' do
    expect(csv_processor.file).to eq 'spec/test.csv'
  end

  it 'should test if file exists' do
    expect(File.exist?(csv_processor.file)).to be_truthy
  end

  it 'gets an array of codes' do
    codes = csv_processor.codes
    expect(codes).to be_an Array
  end

  it 'gets more than 1 code' do
    codes = csv_processor.codes
    expect(codes.count).to be > 1
  end

  it 'gets more than 3 codes' do
    codes = csv_processor.codes
    expect(codes.count).to eq 3
  end

  it 'returns a string for each element of the array' do
    codes = csv_processor.codes
    expect(codes.first).to be_a String
  end

  it 'creates or opens a sql file' do
    sqlfile = csv_processor.sql_file('spec/test.sql')
    expect(File.exist?(csv_processor.sqlfile)).to be_truthy
  end
end
