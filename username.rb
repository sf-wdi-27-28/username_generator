# Make sure to run the tests in your /spec folder
# Run `rspec spec/username_spec.rb` to get started.

def format_name(first, last)
    if first == "" || last == ""
      nil
    else
      new_first = first.gsub(/[\d|\W]/, "")
      new_last = last.gsub(/[\d|\W]/, "")
      name = new_first[0] + new_last
      name.downcase
    end
end

def format_year(year)
  string = year.to_s
  if string.length == 4
    string[2,2]
  end
end

def build_username(first_name, last_name, year)
  "#{format_name(first_name, last_name)}#{format_year(year)}"
end


def check_privilege(user_type=0)
  if user_type == 0
    "user"
  elsif user_type == 1
    "seller"
  elsif user_type == 2
    "manager"
  else
    "admin"
  end

end
