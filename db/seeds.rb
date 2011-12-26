# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

course = Course.create!(
  :name => "お試し問題",
  :description => "お試し問題です",
  :owner_id => 1, # TODO deviseのユーザを作成する
  :sharing => true
)

course.questions.create!(
  :number => 1,
  :title => "Choose one word or phrase that best completes the sentence.",
  :description => "Your prompt _______ to our proposal would be highly appreciated.",
  :choice1 => "respond", :choice2 => "response",:choice3 => "to respond", :choice4 => "responded",
  :answer => 2,
  :explanation => "ビジネス・レターでよく使用される文です。Your の後ろには名詞があることが予想されますが、prompt の品詞を見極めることがまず大切です。これが「迅速な」の意味の形容詞であることが分かれば、その後ろに名詞がこなければいけないことが明らかになります。"
)
course.questions.create!(
  :number => 2,
  :title => "Choose one word or phrase that best completes the sentence.",
  :description => "Let them _______ as they like. They'll never listen to us.",
  :choice1 => "do", :choice2 => "to do", :choice3 => "to be doing", :choice4 => "to have done",
  :answer => 1,
  :explanation => "「…させてあげる」の意味の使役動詞 let は、let ＋目的語＋原形動詞の形をとります。"
)
course.questions.create!(
  :number => 3,
  :title => "Choose one word or phrase that best completes the sentence.",
  :description => "I was just about to leave home, _______ the phone rang.",
  :choice1 => "that", :choice2 => "why", :choice3 => "when", :choice4 => "at that time",
  :answer => 3,
  :explanation => "【着眼点】選択肢のうちで、接続詞機能を有し、かつコンマを介して2つの節を連結できるのは非制限用法をもつ関係副詞のwhenのみである。なお、この場合のwhenは前の節全体を先行詞とする。be about to ～ は「まさに［今にも］～しようとしている」の意。「ちょうど家を出ようとしていたそのときに、電話が鳴った。」"
)
course.questions.create!(
  :number => 4,
  :title => "Choose one word or phrase that best completes the sentence.",
  :description => "Your children have passed the age _______ they need to worry about such illnesses. ",
  :choice1 => "why", :choice2 => "how", :choice3 => "when", :choice4 => "which",
  :answer => 3,
  :explanation => "【着眼点】選択肢はすべて関係詞だが、先行詞がthe ageという「時」を表す名詞句であるから (A) と (B) は消える。次に、このthe ageを受けてthey need to worry about such illnessesの節にどう結びつけていくかだが、the ageという名詞句のままではどこにも差し込む適当な場所はない。したがって、名詞句だけの代用となる関係代名詞 (which) は不可。whenであれば「その年齢において［その年齢のときに］they need to以下である」が成立するのでうまくつながることになる。"
)
course.questions.create!(
  :number => 5,
  :title => "Choose one word or phrase that best completes the sentence.",
  :description => "The real estate agent has three apartments to show you _______ is very near your workplace.",
  :choice1 => ", one of them", :choice2 => ", one of which", :choice3 => "none of whom", :choice4 => "some of which",
  :answer => 2,
  :explanation => "【着眼点】whichやwhomがofを介して数［量］詞と結びつく‘one [some, any, none, all, both, several, enough, many, few, etc.] of which [whom]’の形は非制限用法なので、コンマのない (C) , (D) は不可。加えて (C) は先行詞 (three apartments) が人でない点、(D) は関係詞節内の動詞が単数 (is) である点でも不可。コンマだけで節を結ぶ (A) も不可。"
)
