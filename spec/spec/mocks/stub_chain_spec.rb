require File.dirname(__FILE__) + '/../../spec_helper.rb'

module Spec
  module Mocks
    describe "A chained method stub" do
      before(:each) do
        @class = Class.new do
          def self.existing_class_method
            :original_value
          end

          def existing_instance_method
            :original_value
          end
        end
        @instance = @class.new
        @stub = Object.new
      end

      it "should return expected value from chaining two method calls" do
        @instance.stub_chain!(:msg1, :msg2).and_return(:return_value)
        @instance.msg1.msg2.should equal(:return_value)
        @instance.rspec_verify
      end

      it "should return expected value from chaining four method calls" do
        @instance.stub_chain!(:msg1, :msg2, :msg3, :msg4).and_return(:return_value)
        @instance.msg1.msg2.msg3.msg4.should equal(:return_value)
        @instance.rspec_verify
      end

      it "should return expected value from chaining only one method call" do
        @instance.stub_chain!(:msg1).and_return(:return_value)
        @instance.msg1.should equal(:return_value)
        @instance.rspec_verify
      end

    end
  end
end
