# Inspired by http://blog.nicksieger.com/articles/2011/01/20/rspec-2-matcher-fun
RSpec::Matchers.define :include_only_one_of do |*elements|
  match do |container|
    @included = []
    elements.flatten.each do |e|
      @included << e if container.include?(e)
    end
    @included.count == 1
  end
 
  failure_message_for_should do |container|
    "expected array of #{container.length} elements to include only one member.\n" +
      "Found #{@included.flatten.inspect}"
  end
end