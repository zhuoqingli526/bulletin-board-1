require "rails_helper"

describe "/boards" do
  it "lists the names of each Board record in the database", points: 2 do
    
    board_chi = Board.new
    board_chi.name = "Chicago"
    board_chi.save

    board_nyc = Board.new
    board_nyc.name = "New York"
    board_nyc.save
    
    visit "/boards"

    expect(page).to have_text(board_chi.name),
      "Expected page to have the name, '#{board_chi.name}'"
    
    expect(page).to have_text(board_nyc.name),
      "Expected page to have the name, '#{board_nyc.name}'"
  end
end

describe "/boards" do
  it "has a form", points: 1 do
    visit "/boards"

    expect(page).to have_css("form", minimum: 1)
  end
end

describe "/boards" do
  it "has a label for 'Name' with text: 'Name'", points: 1, hint: h("copy_must_match label_for_input") do
    visit "/boards"

    expect(page).to have_css("label", text: "Name")
  end
end

describe "/boards" do
  it "has at least one input elements", points: 1, hint: h("label_for_input") do
    visit "/boards"

    expect(page).to have_css("input", minimum: 1)
  end
end

describe "/boards" do
  it "has a button with text 'Add board'", points: 1, hint: h("copy_must_match") do
    visit "/boards"

    expect(page).to have_css("button", text: "Add board")
  end
end

describe "/boards" do
  it "creates a Board when 'Add board' form is submitted", points: 5, hint: h("button_type") do
    initial_number_of_boards = Board.count
    test_name = "Chicago"

    visit "/boards"

    fill_in "Name", with: "Chicago"
    click_on "Add board"
    final_number_of_boards = Board.count
    expect(final_number_of_boards).to eq(initial_number_of_boards + 1)
  end
end

describe "/boards" do
  it "saves the name when 'Create board' form is submitted", points: 2, hint: h("label_for_input") do
    test_name = "Chicago"

    visit "/boards"

    fill_in "Name", with: test_name
    click_on "Add board"

    last_board = Board.order(created_at: :asc).last
    expect(last_board.name).to eq(test_name)
  end
end

describe "/boards/[ID]" do
  it "displays the name of the Board", points: 1 do
    
    board_chi = Board.new
    board_chi.name = "Chicago"
    board_chi.save

    visit "/boards/#{board_chi.id}"
    
    expect(page).to have_text(board_chi.name),
      "Expected page to have the name, '#{board_chi.name}'"

  end
end

describe "/boards/[ID]" do
  it "lists the titles of each Post record in the database", points: 1 do
    
    board_chi = Board.new
    board_chi.name = "Chicago"
    board_chi.save

    post_1 = Post.new
    post_1.title = "Guitar lessons"
    post_1.body = "Learn with me"
    post_1.expires_on = Date.today + 7.days
    post_1.board_id = board_chi.id
    post_1.save

    post_2 = Post.new
    post_2.title = "Scuba lessons"
    post_2.body = "Swim with me"
    post_2.expires_on = Date.today + 7.days
    post_2.board_id = board_chi.id
    post_2.save
    
    visit "/boards/#{board_chi.id}"

    expect(page).to have_text(post_1.title),
      "Expected page to have the title, '#{post_1.title}'"
    
    expect(page).to have_text(post_2.title),
      "Expected page to have the title, '#{post_2.title}'"
  end
end

describe "/boards/[ID]" do
  it "lists the titles of each Post record in the database", points: 1 do
    
    board_chi = Board.new
    board_chi.name = "Chicago"
    board_chi.save

    post_1 = Post.new
    post_1.title = "Guitar lessons"
    post_1.body = "Learn with me"
    post_1.expires_on = Date.today + 7.days
    post_1.board_id = board_chi.id
    post_1.save

    post_2 = Post.new
    post_2.title = "Scuba lessons"
    post_2.body = "Swim with me"
    post_2.expires_on = Date.today + 7.days
    post_2.board_id = board_chi.id
    post_2.save
    
    visit "/boards/#{board_chi.id}"

    expect(page).to have_text(post_1.title),
      "Expected page to have the title, '#{post_1.title}'"
    
    expect(page).to have_text(post_2.title),
      "Expected page to have the title, '#{post_2.title}'"
  end
end

describe "/boards/[ID]" do
  it "has a form", points: 2 do

    board_chi = Board.new
    board_chi.name = "Chicago"
    board_chi.save
    
    visit "/boards/#{board_chi.id}"

    expect(page).to have_css("form", minimum: 1)
  end
end

describe "/boards/[ID]" do
  it "has a label for 'Title' with text: 'Title'", points: 1, hint: h("copy_must_match label_for_input") do
    
    board_chi = Board.new
    board_chi.name = "Chicago"
    board_chi.save
    
    visit "/boards/#{board_chi.id}"

    expect(page).to have_css("label", text: "Title")
  end
end

describe "/boards/[ID]" do
  it "has a label for 'Body' with text: 'Body'", points: 1, hint: h("copy_must_match label_for_input") do
    
    board_chi = Board.new
    board_chi.name = "Chicago"
    board_chi.save
    
    visit "/boards/#{board_chi.id}"

    expect(page).to have_css("label", text: "Body")
  end
end

describe "/boards/[ID]" do
  it "has a label for 'Expires on' with text: 'Expires on'", points: 1, hint: h("copy_must_match label_for_input") do
    
    board_chi = Board.new
    board_chi.name = "Chicago"
    board_chi.save
    
    visit "/boards/#{board_chi.id}"

    expect(page).to have_css("label", text: "Expires on")
  end
end

describe "/boards/[ID]" do
  it "has at least one input elements", points: 1, hint: h("label_for_input") do
    
    board_chi = Board.new
    board_chi.name = "Chicago"
    board_chi.save
    
    visit "/boards/#{board_chi.id}"

    expect(page).to have_css("input", minimum: 1)
  end
end

describe "/boards/[ID]" do
  it "has a hidden input for the board ID", points: 1, hint: h("label_for_input") do
    
    board_chi = Board.new
    board_chi.name = "Chicago"
    board_chi.save
    
    visit "/boards/#{board_chi.id}"

    expect(page).to have_selector("input[value='#{board_chi.id}']", visible: false),
      "expected to find a hidden input field with the board's id as the value"

    expect(page).to have_css("input", minimum: 1)
  end
end

describe "/boards/[ID]" do
  it "has a button with text 'Add post'", points: 1, hint: h("copy_must_match") do
    
    board_chi = Board.new
    board_chi.name = "Chicago"
    board_chi.save
    
    visit "/boards/#{board_chi.id}"

    expect(page).to have_css("button", text: "Add post")
  end
end

describe "/boards/[ID]" do
  it "does NOT create a Post when 'Add post' form is submitted with blank body", points: 2 do
    
    board_chi = Board.new
    board_chi.name = "Chicago"
    board_chi.save
    
    visit "/boards/#{board_chi.id}"
    
    initial_number_of_posts = Post.count

    test_title = "Guitar lesson"
    test_date = "08-03-2100"

    fill_in "Title", with: test_title
    fill_in "Expires on", with: test_date

    click_on "Add post"

    final_number_of_posts = Post.count
    expect(final_number_of_posts).to eq(initial_number_of_posts)
  end
end

describe "/boards/[ID]" do
  it "does create a Post when 'Add post' form is submitted", points: 2 do
    
    board_chi = Board.new
    board_chi.name = "Chicago"
    board_chi.save
    
    visit "/boards/#{board_chi.id}"
    
    initial_number_of_posts = Post.count

    test_title = "Guitar lesson"
    test_body = "Learn with me"
    test_date = "08-03-2100"

    fill_in "Title", with: test_title
    fill_in "Body", with: test_body
    fill_in "Expires on", with: test_date

    click_on "Add post"

    final_number_of_posts = Post.count
    expect(final_number_of_posts).to eq(initial_number_of_posts + 1)
  end
end
