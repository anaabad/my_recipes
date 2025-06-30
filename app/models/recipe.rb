class Recipe < ApplicationRecord
  puts "🔁 Loading Recipe model"
  scope :only_matching_ingredients, ->(*substrings) {
    regex = substrings.map { |s| Regexp.escape(s) }.join("|")
    where(
      "jsonb_typeof(ingredients::jsonb) = 'array' AND NOT jsonb_path_exists(
      ingredients::jsonb,
      '$[*] ? (!(@ like_regex \"#{regex}\"))'
    )"
    ).order(ratings: :desc)
  }
  def decorated_rating
    '★' * ratings.to_i + '☆' * (5 - ratings.to_i)
  end

  def decoded_url
    CGI.parse(image.split("url=").second).first.first
  end
end
