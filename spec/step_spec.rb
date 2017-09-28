require "spec_helper"

RSpec.describe(Step) do
  it {should belong_to :recipe}
end
