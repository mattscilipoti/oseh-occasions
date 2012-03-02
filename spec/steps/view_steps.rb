steps_for :global do
  def submit_form
    page.find("input[type='submit']").click
  end

  step "I should see :content" do |content|
    page.should have_content(content)
  end
end
