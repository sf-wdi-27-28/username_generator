# Make sure to run the tests in your /spec folder
# Run `rspec spec/username_spec.rb` to get started.

def format_name(first, last)
  if last=="" || first==""
    return nil
  end
  first1=first.strip.downcase
  last1=last.strip.downcase
  first1=first1.gsub(/[^a-z]/,"")
  last1=last1.gsub(/[^a-z]/,"")
  name = first1[0]+last1
  name = name.downcase.delete(" ")
  name
end

def format_year(num)
  snum = num.to_s
  if snum.length==4
    snum[-2..-1]
  end
end

def user_type_prefix(i)
  if i==0
    ""
  elsif i==1
    "seller-"
  elsif i==2
    "manager-"
  elsif i==3
    "admin-"
  end
end

def check_privilege(i=0)
  i=[0,1,2,3].select {|num| num<=i}.max
  if i==0
    "user"
  elsif i==1
    "seller"
  elsif i==2
    "manager"
  elsif i==3
    "admin"
  else
    "user"
  end
end

def build_username(first,last,num,type=0)
  prefix= user_type_prefix(type)
  fyear = format_year(num)
  fname=format_name(first,last)
  username=prefix+fname+fyear
  return username
end

$usernames={}
$username=:$username
$username2=0
$value=0

def generate_username(first,last,num,type=0)
  $username=build_username(first,last,num,type=0)
  if $usernames.include?($username)
    $usernames[$username] +=1
    suffix = "_"+$usernames[$username].to_s
    $username=build_username(first,last,num,type=0)+suffix
    return $username
  else
    $usernames[$username] = 0
  end
  $username
end
