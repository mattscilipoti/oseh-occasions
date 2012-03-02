steps_for :global do
  step "I should see this notice :notice" do |notice|
    within('.flash') do
      page.should have_content(notice)
    end
  end
end
