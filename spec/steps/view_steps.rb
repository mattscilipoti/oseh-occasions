steps_for :global do
  def submit_form
    page.find("input[type='submit']").click
  end

  step "I should see this notice :notice" do |notice|
    page.should have_css('.flash.notice', notice)
  end
end


