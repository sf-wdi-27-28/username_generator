# Make sure to run the tests in your /spec folder
# Run `rspec spec/username_spec.rb` to get started.

def format_name(first, last)
  if first== "" or if last == ""
    nil
  else
    firstInit = first.delete(" ""!""-""?""@""\'"".")[0].downcase
    return firstInit+last.downcase.delete(" ""!""-""?""@""\'"".")
  end
  end
end

def format_year(year)
  years = year.to_s
  if years.length == 4
    years[2,2]
  else
    nil
  end
end

def check_privilege(num = 0)
  if num.floor <=0
    "user"
  elsif num.floor == 1
    "seller"
  elsif num.floor == 2
    "manager"
  elsif num >= 3
    "admin"
  else
    "user"
  end
end

def user_type_prefix(num)
  if check_privilege(num) == "user"
    check_privilege = ""
  else
    check_privilege(num)<<"-"
  end
end

$users = []


def build_username(first, last, year, usr = 0)
  user_type_prefix(usr) + format_name(first, last) + format_year(year)
end

def generate_username(first, last, year, usr = 0)
  new_user = build_username(first, last, year, usr)
  if $users.include?(new_user) == true
    foo = $users.to_s
    i = foo.scan(/#{new_user}/).length.to_s
    $users.push(new_user<<("_"+i))
    new_user
  else
    $users.push(new_user)
    new_user
  end
end
