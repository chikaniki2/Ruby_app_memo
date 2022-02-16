require "csv"

puts "1(新規でメモを作成) 2(既存のメモ編集する)"

memo_type = gets.chomp.to_s

if memo_type == "1"
	#new
	puts "拡張子を除いたファイル名を入力してください"
	filename = gets.chomp.to_s #file name

	p "メモしたい内容を記入してください"
	p "完了したら、Ctrl＋Dを押してください"
	puts "====="

	txt = readlines #input text

	#save CSV
	CSV.open(filename + '.csv','w') do |csv|
  		txt.each do |str|
			csv << [str]
  		end
	end

	puts "====="
	puts "#{filename}.csv に新規保存しました。"
	puts "====="

elsif memo_type == "2"
	#edit mode
	puts "編集したいCSVのファイル名を入力してください（拡張子抜き）"
	filename = gets.chomp.to_s #file name

	#filecheck

	p "追記したい内容を記入してください"
	p "完了したら、Ctrl＋Dを押してください"
	puts "====="

	txt = readlines #input text

	#save CSV
	CSV.open(filename + '.csv','a') do |csv|
  		txt.each do |str|
			csv << [str]
  		end
	end

	puts "====="
	puts "#{filename}.csv を編集・保存しました。"
	puts "====="

else
	puts "1か2を入力してください"
	
end #ifend