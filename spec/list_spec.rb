require "spec_helper"

RSpec.describe(List) do
  it { should belong_to(:recipe) }
  it { should belong_to(:ingredient) }
end
