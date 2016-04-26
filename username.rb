# Make sure to run the tests in your /spec folder
# Run `rspec spec/username_spec.rb` to get started.

def format_name(first, last)
  first.gsub!(/\d|\W|_/, "")
  last.gsub!(/\d|\W|_/, "")
  if first.empty? || last.empty?
    nil
  else
    first.split(" ").join.downcase[0] + last.split(" ").join.downcase
  end
end

def format_year year
  if year.to_s.length == 4
    year.to_s[-2,2]
  end
end


def build_username (first_name, last_name, birth_year, privilege_level=0)
  "#{user_type_prefix(privilege_level)}#{format_name(first_name,last_name)}#{format_year(birth_year)}"
  # format_name(first_name,last_name) + format_year(birth_year)
end

def check_privilege(pl=0)
  pl = pl.floor
  if pl > 2
    "admin"
  elsif pl == 0
    "user"
  elsif pl == 1
    "seller"
  elsif pl == 2
    "manager"
  end
end

def user_type_prefix (lvl)
  if check_privilege(lvl) != "user"
    "#{check_privilege(lvl)}-"
  else
    ""
  end
end

$usrs = {}
def generate_username(first_name, last_name, birth_year, privilege_level=0)
  usr = build_username(first_name, last_name, birth_year, privilege_level)
  if $usrs[usr].nil?
    $usrs[usr] = 0
    usr
  else
    $usrs[usr] +=1
    count = $usrs[usr].to_s
    usr + "_" + count
  end
end
