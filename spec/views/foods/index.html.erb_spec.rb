require 'rails_helper'

RSpec.describe 'foods/index', type: :view do
  let(:user) { TestModelCreator.user }

  before do
    assign(:user, user)
    assign(:foods, [])
    render
  end

  it "renders food list table title" do
    expect(rendered).to match(/Food List/)
  end

  it 'renders food list table elements' do
    expect(rendered).to have_selector('table')
    expect(rendered).to have_selector('th', text: 'Name')
    expect(rendered).to have_selector('th', text: 'Measurement Unit')
    expect(rendered).to have_selector('th', text: 'Unit Price')
    expect(rendered).to have_selector('th', text: 'Quantity')
    expect(rendered).to have_selector('th', text: 'Actions')
  end

  it 'renders button to add new food' do
    expect(rendered).to have_selector('a.btn.btn-primary', text: 'Add New Food')
  end
end
