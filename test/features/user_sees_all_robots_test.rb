require_relative '../test_helper'

class UserSeesAllRobotsTest < FeatureTest

  def test_home_page_displays_welcome_message
    visit("/")
    assert page.has_content?("Robot World")
    assert page.has_content?("Robot Index")
    assert page.has_content?("New Robot")
  end

  def test_home_page_renders_with_css
    visit("/")
    assert page.has_css?("body", "html")
    within(".container") do
      assert page.has_content?("Robot Index")
    end
  end


  def test_it_creates_robot
    visit("/")
    click_link("New Robot")
    assert_equal "/robots/new", current_path
    fill_in("robot-name", with:"adam")
    fill_in("robot-city", with: "denver")
    fill_in("state", with: "CO")
    fill_in("avatar", with: "android")
    fill_in("birthdate", with: "8-4-85")
    fill_in("date hired", with: "7-6-15")
    fill_in("department", with: "student")
    click_button("Create Robot")
    assert_equal "/robots", current_path


    within(".contadiner") do
      assert page.has_content?("New Robot")
    end

  end

  def test_user_can_fill_in_task_form
    skip
    creates_task
    assert_equal "/tasks", current_path

    within(".container") do
      assert page.has_content?("new task")
    end
  end

  def test_user_can_edit_a_task
    skip
    creates_task

    click_link("edit")

    fill_in("task-title", with: "new task edited")
    fill_in("task-description", with: "new description edited")
    click_button("Update Task")

    assert_equal "/tasks/1", current_path
    within(".container") do
      assert page.has_content?("new task edited")
    end
  end

  def test_user_can_delete_a_task
    skip

    creates_task
    assert_equal "/tasks", current_path
    click_button("delete")

    refute page.has_content?("new task")
  end

  def test_a_user_can_see_a_single_task
    skip
    creates_task
    assert_equal "/tasks", current_path

    click_link("new task")
    assert_equal "/tasks/1", current_path
    assert page.has_content?("new task")
  end
end
