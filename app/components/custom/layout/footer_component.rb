class Layout::FooterComponent < ApplicationComponent; end

require_dependency Rails.root.join("app", "components", "layout", "footer_component").to_s

class Layout::FooterComponent < ApplicationComponent
  delegate :content_block, to: :helpers
end
