# Make sure to run the tests in your /spec folder
# Run `rspec spec/username_spec.rb` to get started.

def format_name(first, last)
  if first == "" || last == ""
    nil
  else
    first = first.gsub(/\s+/, '')
    last = last.gsub(/\s+/, '')
    (first[0] + last).downcase
  end
end


def format_year(year)
  year = year.to_s
  year.length == 4 ? year[-2,2] : nil
end


def build_username(first, last, year, level=0)
  # "#{format_name(first, last)}#{format_year(year)}"
  name = format_name(first, last)
  return nil if name.nil?
  
  yy = format_year(year)
  return nil if yy.nil?

  user_type_prefix(level) + name + yy
end


def check_privilege(type=0)
  $user_types = ["user", "seller", "manager", "admin"]
  if type >= 0
    $user_types[type] || $user_types.last
  else
    $user_types.first
  end
end


def user_type_prefix(level)
  level >=1 ? check_privilege(level) + "-" : ""
end

$user_counts = {}
def generate_username(first,last,year,level=0)
  username = build_username(first,last,year,level)

  if $user_counts[username].nil?
    $user_counts [username] = 0;
    username
  else
    $user_counts[username] +=1
    user_count = $user_counts[username].to_s
    username + "_" + user_count
  end
end
