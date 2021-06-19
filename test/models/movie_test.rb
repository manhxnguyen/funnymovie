require "test_helper"

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Field required" do
    movie = Movie.new(:user_id => '',
                      :title => '',
                      :description => 'Err...',
                      :link => 'Something')

    assert movie.errors[:title].any?
    assert movie.errors[:description].any?
    assert movie.errors[:user_id].any?
    assert movie.errors[:link].any?
  end
end
