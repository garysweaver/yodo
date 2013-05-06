require 'rails'
require 'spec_helper'
require 'yodo/ams'

#TODO: clean this up. this test, the serializers, models, and schema were coded semi-randomly due to lack of time.
describe 'ams:analyze' do
  it 'returns expected results' do      
    results = Yodo::AMS.analyze_all
    results[AlphaSerializer].should eq({:suggested_includes=>[:deltas, :gam, :beta, :alpha, {:delts=>[:delts]}]})
    results[GammaSerializer].should eq({:suggested_includes=>[]})
    results[DeltaSerializer].should eq({:suggested_includes=>[:delts]})
    results[BetaSerializer].should eq({:suggested_includes=>[:gammas, :gamma, :deltas, :ds, :beta, :gam, :bet, {:al=>[:deltas, :gam, :beta, :alpha, {:delts=>[:delts]}]}]})
    puts "into README:"
    puts; puts
    puts Yodo::AMS.analyze_all.inspect
    puts; puts
    
    # take the results of Yodo::AMS.analyze_all and sort results in a human readable format
    Yodo::AMS.analyze_all.map {|s,h| h.map {|k,v| "#{s.name} #{k.to_s.gsub('_',' ')} = #{v}" unless v.empty?}.compact}.flatten.sort.each {|a| puts a}; nil
    puts; puts
  end
end
