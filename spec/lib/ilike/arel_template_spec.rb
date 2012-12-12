require 'spec_helper'

module Ilike
  describe ArelTemplate do
    let(:template)       { ArelTemplate.new([:name, 'andrea%'])}
    let(:multi_template) { ArelTemplate.new([:name, ['%andrea%', '%longhi%']])}

    it 'template builds the basic code for arel' do
      template.template('andrea%').should ==  "(arel_table[:name].matches('andrea%'))"
    end

    context 'when passing multiple keywords for field' do
      it 'builds an array of templates' do
        multi_template.build.should be_an(Array)
      end

      it 'builds expected templates' do
        expected = ["(arel_table[:name].matches('%andrea%'))", "(arel_table[:name].matches('%longhi%'))"]
        multi_template.build.should == expected
      end
    end
  end
end