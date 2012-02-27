steps_for :global do
  def submit_form
    page.find("input[type='submit']").click
  end
end
