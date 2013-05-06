[![Build Status](https://secure.travis-ci.org/garysweaver/yodo.png?branch=master)](http://travis-ci.org/garysweaver/yodo) [![Gem Version](https://badge.fury.io/rb/yodo.png)](http://badge.fury.io/rb/yodo)
# Yodo

Determines what includes you need to avoid n+1 queries when using [ActiveModel::Serializers][active_model_serializers].

## Usage

If you already have a Rails project setup with `ActiveModels::Serializers`, add this to your Gemfile:

```ruby
gem 'yodo', '~> 0.0.1'
```

Then:

```
bundle install
```

In console:

```ruby
rails c
```

Do the following:

```ruby
require 'yodo/ams'

# Get includes required as hash

Yodo::AMS.analyze_all

# That might return {AlphaSerializer=>{:suggested_includes=>[:deltas, :gam, :beta, :alpha, {:delts=>[:delts]}]}, GammaSerializer=>{:suggested_includes=>[]}, DeltaSerializer=>{:suggested_includes=>[:delts]}, BetaSerializer=>{:suggested_includes=>[:gammas, :gamma, :deltas, :ds, :beta, :gam, :bet, {:al=>[:deltas, :gam, :beta, :alpha, {:delts=>[:delts]}]}]}}

# Take the results of Yodo::AMS.analyze_all and sort results in a human readable format

Yodo::AMS.analyze_all.map {|s,h| h.map {|k,v| "#{s.name} #{k.to_s.gsub('_',' ')} = #{v}" unless v.empty?}.compact}.flatten.sort.each {|a| puts a}; nil

# That might output:
#
# AlphaSerializer suggested includes = [:deltas, :gam, :beta, :alpha, {:delts=>[:delts]}]
# BetaSerializer suggested includes = [:gammas, :gamma, :deltas, :ds, :beta, :gam, :bet, {:al=>[:deltas, :gam, :beta, :alpha, {:delts=>[:delts]}]}]
# DeltaSerializer suggested includes = [:delts]
```

### Release Notes

See the [Changelog][changelog] for basically what happened when, and git log for everything else.

### Contributing

Please fork, make changes in a separate branch, and do a pull request for your branch.

### Contributors

* Gary Weaver (https://github.com/garysweaver)

### License

Copyright (c) 2013 Gary S. Weaver, released under the [MIT license][lic].

[active_model_serializers]: https://github.com/rails-api/active_model_serializers
[changelog]: https://github.com/garysweaver/yodo/blob/master/CHANGELOG.md
[lic]: http://github.com/garysweaver/yodo/blob/master/LICENSE
