class CodeGenerator
  attr_accessor :number_of_codes, :size

  def initialize(number_of_codes=1, size=16)
    @number_of_codes = number_of_codes
    @size = size
  end

  def codes(range_end=number_of_codes)
    range_end = range_end.to_i.abs
    (0...range_end).map { generate_activation_code }
  end

  def write_csv(file_name)
    File.open(file_name, 'w+') do |file|
      codes.each do |code|
        file.write("#{code}\n")
      end
    end
  end

  private
  def charset
    %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
  end

  def generate_activation_code
    (0...size).map{ charset.to_a[rand(charset.size)] }.join
  end
end
