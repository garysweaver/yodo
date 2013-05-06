['4.0.0.rc1', '3.2.13'].each do |rails_version|
  ['0.8.1', 'edge'].each do |active_model_serializers_version|
    appraise "rails_#{rails_version}_with_active_model_serializers_#{active_model_serializers_version}" do
      gem 'rails', rails_version
      if active_model_serializers_version == 'edge'
        gem 'active_model_serializers', :git => 'git://github.com/rails-api/active_model_serializers.git'
      else
        gem 'active_model_serializers', active_model_serializers_version
      end
    end
  end
end
