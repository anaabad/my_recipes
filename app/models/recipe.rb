class Recipe < ApplicationRecord
  puts "🔁 Loading Recipe model"
  scope :only_matching_ingredients, ->(*substrings) {
    regex = substrings.map { |s| Regexp.escape(s) }.join("|")
    where(
      "jsonb_typeof(ingredients::jsonb) = 'array' AND NOT jsonb_path_exists(
      ingredients::jsonb,
      '$[*] ? (!(@ like_regex \"#{regex}\"))'
    )"
    )
  }
end
