# 로또 번호 추천 사이트를 만든다.
#
# get ' / ' {} : ' 로또 추천 '이라는 버튼을 만들고 -> '/lotto'
#
# get ' /lotto ' {} : 로또 번호를 추천하는데 매번 추천된 번호를 lotto.txt 파일에 저장을 한다.


require 'sinatra'
require 'csv'
require 'date'

get '/' do
  erb :index
end

get '/lotto' do
  @result = (1..45).to_a.sample(6)

  File.open("lotto.txt", "a+") do |f|
    f.write("로또 번호 : #{@result} \n")
  end

  # CSV는 엑셀로 파일이 열린다.
  CSV.open("log.csv", "a+") do |csv|
    csv << [@result, Time.now.to_s]
  end

  #erb 밑으로는 실행이 되지 않는다.
  #때문에 위에서 작업을 다 끝내고 써주어야 한다.
  erb :lotto

end
