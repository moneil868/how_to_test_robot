require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1
    # arrange
    robot = Robot.new

    # act
    robot.needs_repairs = true
    robot.foreign_model = true

    # assert
    assert_equal 1, robot.station
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    # arrange
    robot = Robot.new

    # act
    robot.needs_repairs = true
    robot.vintage_model = true

    # assert
    assert_equal 2, robot.station
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    # arrange
    robot = Robot.new

    # act
    robot.needs_repairs = true

    # assert
    assert_equal 3, robot.station
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    # arrange
    robot = Robot.new

    # act

    # assert
    assert_equal 4, robot.station
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    # arrange
    robot = Robot.new

    # act

    # assert
    assert_equal -1, robot.prioritize_tasks
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    # arrange
    robot = Robot.new

    # act
    robot.todos = ["task one", "task two"]

    # assert
    assert_equal robot.todos.max, robot.prioritize_tasks
  end

  def test_workday_on_day_off_returns_false
    # arrange
    robot = Robot.new

    # assert
    assert_equal false, robot.workday?(robot.day_off)
  end

  def test_workday_not_day_off_returns_true
    # arrange
    robot = Robot.new

    # act
    robot.day_off = "Friday"

    # assert
    assert_equal true, robot.workday?("Monday")
  end

end
