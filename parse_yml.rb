require 'yaml'
yml_file = YAML::load_file('origin.yml')




str = "[谢行知]
谢行知

在分享之前，志愿者还会在群里搜集大家的问题的@吴笛 

15:14
[吴笛]

各位好，我来这边请大家帮忙啦

[谢行知]
谢行知

@少林 快来！

[吴笛]

周六我要在开智群里面分享点知识，我自己一个人难以确保我讲得明白，有用，所以要大家帮忙评估一下。

[吴笛]

我是这样打算的，放空我的头脑，不自以为是也不妄自菲薄，请各位来听一听我要讲的几个要点，然后明确指出这些点中，哪些点你
们觉得值得说/不值得说，哪些点你们觉得我讲的清晰/模糊，哪些点你们觉得偏主观臆断/相对客观一点。"








str = str.gsub(/\d{2}\:\d{2}/, '').gsub(/\*/, '').gsub(/\n/,'').gsub(/@/, '').gsub(/:/, '')
items = str.scan(/\[(.*?)\]([^\[]*)/)

p items


items.each_with_index do |item, index|
  # p index
  # p item[0]
  # p item[1]

  item[1] = item[1].gsub(/^#{item[0]}/, '')
  yml_file['scripts'][index]['npc'] = item[0]
  yml_file['scripts'][index]['sentences'][0]['text'] = item[1]


  p File.open('origin.yml', 'w') {|f| f.write yml_file.to_yaml }

  p '==============='
end


















