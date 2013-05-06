module Yodo
  class AMS
    class << self
      # Eager loads all Rails' classes to get list of all descendants of ActiveModel::Serializer. Then
      # returns hash of serializers to results of analysis. Currently the only key in each serializer's
      # results is :suggested_includes which is a hash representing the includes that should be done for
      # each ActiveModel::Serializer or an empty array.
      def analyze_all
        Rails.application.eager_load!
        analyze(*ActiveModel::Serializer.descendants)
      end

      # Takes one or more descendants of ActiveModel::Serializer and returns hash of serializers to 
      # results of analysis. Currently the only key in each serializer's results is 
      # :suggested_includes which is a hash representing the includes that could perhaps be used to avoid
      # n+1 queries or an empty array.
      def analyze(*args)
        args.pop if args.last.is_a?(Hash)
        serializer_to_results = {}        
        args.each do |serializer|
          serializer_to_results[serializer] = {:suggested_includes => find_includes(serializer)}
        end
        serializer_to_results
      end

    private
      def find_includes(serializer, done = {})
        # don't follow refs that we've already resolved
        return [] if done[serializer]
        results = []
        serializer._associations.each do |k,v|
          if v.options[:serializer].respond_to?(:_associations)
            if results.last.is_a?(Hash)
              options = results.last
            else
              results << (options = {})
            end
            # skip self-references or we'll never get done with this serializer
            associations_with_defined_serializers = v.options[:serializer] == serializer ? [] : find_includes(v.options[:serializer], done)
            if associations_with_defined_serializers.empty?
              results.prepend(k)
            else
              options[k] = associations_with_defined_serializers
            end
          else
            results.prepend(k)
          end
        end
        # inefficient, but works for now...
        if results.last.is_a?(Hash) && results.last.empty?
          results.pop
        end
        done[serializer] = true
        results
      end
    end
  end
end