require 'code_generator'

RSpec.describe CodeGenerator do

  let(:codegen) { CodeGenerator.new }

  it 'should create a CodeGenerator object' do
    expect(codegen).to be_a CodeGenerator
  end

  it 'should generate 1 code by default' do
    codes = codegen.codes
    expect(codes.count).to eq 1
  end

  it 'should generate a code with 16 characters by default' do
    code = codegen.codes
    expect(code.first.length).to eq 16
  end

  context 'there are 2 ways to set number of codes' do
    it 'should generate 500 codes when initialized with number of codes' do
      codegen = CodeGenerator.new(500)
      codes = codegen.codes
      expect(codes.count).to eq 500
    end

    it 'should generate 500 codes when initialized with number of codes' do
      codes = codegen.codes(500)
      expect(codes.count).to eq 500
    end
  end

  it 'should write to csv file' do
    codegen = CodeGenerator.new(100)
    codes = codegen.write_csv('spec/generated_codes.csv')
    expect(File.exist?('spec/generated_codes.csv')).to be_truthy
  end
end
