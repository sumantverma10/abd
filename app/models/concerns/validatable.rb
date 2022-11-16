module Validatable
    extend ActiveSupport::Concern
    included do
        validates :name, uniqueness: true
    end
end