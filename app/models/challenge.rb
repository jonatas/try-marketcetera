class Challenge < ActiveRecord::Base
  attr_accessible :background_image_url, :code_challenge, :correct_answer, :description, :image_url, :tags, :title
  def valid_answer? answer
    correct_answer.is_a? String and correct_answer == answer
  end
  def next_challenge
    Challenge.where("id > ?", id).order("id asc").limit(1).first
  end
end
