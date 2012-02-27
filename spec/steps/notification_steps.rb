steps_for :global do
  step "I should see this notice :notice" do |notice|
    page.should have_css('.flash.notice', notice)
  end
end
