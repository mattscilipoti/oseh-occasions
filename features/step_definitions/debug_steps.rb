step 'debug' do
  debugger
  puts 'continuing'
end

step 'show me the page' do
  save_and_open_page
end
