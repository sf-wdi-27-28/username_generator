# Make sure to run the tests in your /spec folder
# Run `rspec spec/username_spec.rb` to get started.

def format_name(first, last)
    if first == "" || last == ""
      nil
    else
      new_first = first.gsub(/\d|\W/, "")
      new_last = last.gsub(/\d|\W/, "")
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

def build_username(first_name, last_name, year,num=0)
  "#{user_type_prefix(num)}#{format_name(first_name, last_name)}#{format_year(year)}"
end


def check_privilege(user=0)
  user_type = user.floor
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

def user_type_prefix(num=0)
  if num == 0
    ""
  else
    "#{check_privilege(num)}"+"-"
  end
end

$count = {}

def generate_username(first, last, year, level=0)
  username = build_username(first, last, year, level)
  if $count[username].nil?
    $count[username] = 0;
    username
  else
    $count[username] +=1
    u_count = $count[username].to_s
    username + "_" + u_count
  end
end



# $arr = []
# $n = 1
# def generate_username(first_name, last_name, birth_year, privilege_level=0)
#   username = build_username(first_name, last_name, birth_year, privilege_level)
#   if $arr.include?(username) == false
#     $arr.push(username)
#     return username
#   elsif $arr.include?(username) == true
#     $arr.length.times do |i|
#       if i == username
#         user = username + "_" + $n.to_s
#         $arr.push(user)
#         $n += 1
#         return user
#       end
#     end
#   end
# end
