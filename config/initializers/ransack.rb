Ransack.configure do |config|
  config.add_predicate 'cont', # Name your predicate
                       arel_predicate: 'matches',
                       formatter: proc { |s| ActiveSupport::Inflector.transliterate("%#{s}%") }, # Note the %%
                       validator: proc { |s| s.present? },
                       compounds: true,
                       type: :string
end
