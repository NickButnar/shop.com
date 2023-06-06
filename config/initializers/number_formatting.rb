Rails.application.config.to_prepare do
  ActionView::Helpers::NumberHelper.include(Module.new do
    def self.default_options
      {
        precision: 0,
        separator: '.',
        delimiter: ',',
        unit: '$'
      }
    end
  end)
end
