require "spec_helper"

RSpec.describe(Ingredient) do
  it { should have_many :lists}
  it {should have_many :recipes}
end
