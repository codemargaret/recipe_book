require "spec_helper"

RSpec.describe(Tag) do
  it {have_and_belong_to_many :recipes}
end
