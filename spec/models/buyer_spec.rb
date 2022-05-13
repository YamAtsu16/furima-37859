require 'rails_helper'

RSpec.describe Buyer, type: :model do
  belongs_to :order
end
