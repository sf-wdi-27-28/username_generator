# Make sure to run the tests in your /spec folder
# Run `rspec spec/username_spec.rb` to get started.

def format_name(first, last)
  if last == "" || first == ""
    nil
  else
    first = first.gsub(/\s+/, '')
    last = last.gsub(/\s+/, '')
    (first[0] + last).downcase
  end
end

def format_year(num)
  year = num.to_s
  if (year.length) == 4
    ending = year[-2,2]
  else
    nil
  end
  ending
end

def check_privilege(i=0)
  i = i.floor
  if i == 0
    "user"
    elsif i == 1
      "seller"
    elsif i == 2
      "manager"
    else
      "admin"
  end
end

def user_type_prefix(i)
  if i == 0
    ""
  elsif i == 1
    "seller-"
  elsif i == 2
    "manager-"
  elsif i == 3
    "admin-"
  end
end

def build_username(first_name, last_name, birth_year, type=0)
  prefix = "#{user_type_prefix(type)}"
  username = prefix + "#{format_name(first_name,last_name)}#{format_year(birth_year)}"
  username
end


$arr = []
$n = 1
def generate_username(first_name, last_name, birth_year, privilege_level=0)
  username = "#{build_username(first_name, last_name, birth_year, privilege_level)}"
  if
    $arr.include?(username) == false
    $arr.push(username)[-1]
  else
    $arr.include?(username) == true
    $n =+ 1
    user = username + "_" + $n.to_s
    $arr.push(username)
    return user
  end
end
