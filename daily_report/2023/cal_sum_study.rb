sum = 0
time = 0
Dir.glob('*.md') do |item|
  File.open(item, "r", encoding: "UTF-8", invalid: :replace, undef: :replace, replace: '?') do |f|
    flag = false
    f.each_line do |line|
      if flag
        time = line.slice(0..(line.index("h")-1)).to_i
        sum += time
        break
      end
      if line.include?("## 学習時間")
        flag = true
      end
    end
  end
  # puts [item, "#{time}h"].join(": ")
end

days = Dir.glob('*.md').size
puts "#{days}日"
puts "#{sum}時間"
puts "1日平均勉強時間#{sum/days.to_f}時間"