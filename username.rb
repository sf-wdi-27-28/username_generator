# Make sure to run the tests in your /spec folder
# Run `rspec spec/username_spec.rb` to get started.

def format_name(first, last)
  if first == '' || last == ''
    nil
  else
    first.gsub!(/[\W\d]/, '')
    last.gsub!(/[\W\d]/, '')
    first[0].downcase << last.downcase
  end
end

def format_year year
   year = year.to_s
   if year.length == 4
   year[2..3]
   end
end

def build_username (first, last, year, privilege_level=0)
  "#{user_type_prefix(privilege_level)}#{format_name(first, last)}#{format_year(year)}"
end


def check_privilege (level=0)
 types = ["user", "seller", "manager", "admin"]
 if level > 3
   types.last
 else
   types[level]
 end
end


def user_type_prefix (level)
  if level >= 1
  check_privilege(level) + "-"
  else
   ""
  end
end

$usernames = Hash.new
def generate_username (first_name, last_name, birth_year, privilege_level=0)
  user = build_username(first_name, last_name, birth_year, privilege_level)
  if $usernames[user] == nil
    $usernames[user] = 0
    user
  else
    count = $usernames[user] + 1 #access the key's value and add 1
    $usernames[user] = count
    user + '_' + count.to_s
  end
end
