# Make sure to run the tests in your /spec folder
# Run `rspec spec/username_spec.rb` to get started.

def format_name(first, last)
first = first.strip.delete ' '
last = last.strip.delete ' '
return nil if last.empty? || first.empty?
username = first.slice(0)<<last
username.downcase
end

def format_year(year)
year = year.to_s
year.length==4? year.slice!(2,3).to_s : nil
end



$user_type = ["user", "seller", "manager", "admin"]

def check_privilege(int=0)
  if int >= 0
    $user_type[int] || $user_type.last
  else
    $user_type.first
  end
end

def user_type_prefix(int=0)
  int==0 ? "": "#{check_privilege(int)}"<<"-"
end

def build_username(first,last,year,int=0)
  "#{user_type_prefix(int=0)}#{format_name(first,last)}#{format_year(year)}"
end

$user_counts = {}

def generate_username(first, last, year, level=0)
  username = build_username(first, last, year, level)

  if $user_counts[username].nil?
    $user_counts[username] = 0;
    username
  else
    $user_counts[username] +=1
    user_count = $user_counts[username].to_s
    username + "_" + user_count
  end
end
