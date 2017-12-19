I18n.load_path += Dir[File.join(File.expand_path('../../', __FILE__), 'locales', '*.yml').to_s]
I18n.default_locale = :en
# Add method to I18n
module I18n
  def self.with_options(prefix)
    l = ->(str) { return I18n.t(prefix + str) }
    yield(l)
  end
end
