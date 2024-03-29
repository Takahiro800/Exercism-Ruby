# Exercism-Ruby

Exercismで学習したことを問題ごとに整理しています

# Simple Calcurator

- 例外処理について学んだ
- ほぼ、チェリー本を読んで調べた

```ruby
begin
	# 例外が起こりそうな処理
rescue ZeroDivisionEroor
	puts "特定の例外クラスの処理を書くことができる・カンマで同時に複数の例外クラスも可能"
rescue => （例外オブジェクトを格納する変数）eが多い
	puts #{e.class}
	puts #{e.message}

	puts "backtrace ------------"
	puts e.backtrace
	puts "----------------------"
end
```

### 独自の例外クラスを定義する p.361~

```ruby
# 例外処理を自作
  class UnsupportedOperation < StandardError
	  # 独自のクラス名を与えるのが目的なので、実装コードは特に書かない
		# 必要であれば独自のメソッド・属性を追加することも可能
	end
```

- StandardErrorクラスを継承して作成する

### 参考コード

[kniknoo&#39;s solution for Simple Calculator in Ruby on Exercism](https://exercism.org/tracks/ruby/exercises/simple-calculator/solutions/kniknoo)

```ruby
"#{first_operand} #{operation} #{second_operand} = #{first_operand.send(operation, second_operand)}"
```

send メソッド初めて知った　レシーバーに対して指定した文字列のメソッドを実行する

```ruby
str = 'a,b,c'

# str.split(',')と同じ
str.send('split', ',') #=> ["a", "b", "c"]
```

# Amusement -park-improvements

- 値が存在するかどうかの判定

```ruby
!nil?
```

# Assembly line

- [ ]  CASE式

```ruby
case @speed
    when 1..4
      1
    when 5..8
      0.9
    when 9
      0.8
    when 10
      0.77
  end
```

- [ ]  private method, 定数の設定, .floor 関数

```ruby
class AssemblyLine
  HOURLY_YIELD = 221

  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    @speed * HOURLY_YIELD * success_rate
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).floor
  end

  private
  def success_rate
    case @speed
    when 1..4
      1
    when 5..8
      0.9
    when 9
      0.8
    when 10
      0.77
    end
  end
end
```

# ****Savings Account****

- case
- 再帰

# Bird Count

- 配列の扱いかたについて

### 合計値を求める

- .sum

### 条件に一致する要素数を取得する

- .count{ |el| 条件式 }

### 条件に一致する要素の存在を確認する(述語)

- .include?(値)
- .any(|el| 条件式)

```ruby
class BirdCount
  def self.last_week
    [0, 2, 5, 3, 7, 8, 4]
  end

  def initialize(birds_per_day)
    @week = birds_per_day
  end

  def yesterday
    @week[-2]
  end

  def total
    @week.sum
  end

  def busy_days
    @week.count{ |x| x >= 5 }
  end

  def day_without_birds?
    @week.include?(0)
    # @week.any?{ |el| el==0 }
  end
end
```

# **[Boutique Inventory](https://exercism.org/tracks/ruby/exercises/boutique-inventory)**

### detect, find, selectについて

1. detect, find は同じメソッド
    - findがActiveRecordにも存在するので、区別するために
        - 標準モジュールのEnumerableには `detect`
        - ActiveRecodrには `find`
    - selectは条件式に一致する要素を全て返す

        [【Ruby】findメソッドの使い方【detect・selectとの違いとは】 | ポテパンスタイル](https://style.potepan.com/articles/28033.html)

2. fetch
    - hashに対して使うと、引数をkeyに持つ値があればそれを返す
    - ない場合を考慮してdefault値を第二引数として渡すこともできる

    ```ruby
    h = {foo: 0, bar: 1, baz: 2}
    h.fetch(:bar) # => 1

    {}.fetch(:nosuch, :default) # => :default
    ```


```ruby
class BoutiqueInventory
  def initialize(items)
    @items = items
  end

  def item_names
    items.map { |i| i[:name] }.sort
  end

  def cheap
    items.select { |i| i[:price] < 30 }
  end

  def out_of_stock
    items.select { |i| i[:quantity_by_size].empty? }
  end

  def stock_for_item(name)
    items.detect { |i| i[:name] == name }.fetch(:quantity_by_size)
  end

  def total_stock
    items.map { |i| i[:quantity_by_size].values.sum }.sum
  end

  private
  attr_reader :items
end
```

# Series

- Stringクラスのオブジェクトに対して、各文字列に処理を行うことができる
    - `each_char`
- 連続した要素をつなげる
    - `each_cons(n)`

```ruby
class Series
  def initialize(num)
    @num = num
  end

  def slices(n)
    raise ArgumentError if @num.length < n

    @num.each_char.each_cons(n).map(&:join)
  end
end
```

# ResistorColorDuo

- Hashの宣言方法で `⇒` と`:` は別もの扱い
- 配列展開を学んだ

```ruby
module ResistorColorDuo
  COLOR_TO_VALUE = {
    "black"=> "0",
    "brown"=> "1",
    "red"=> "2",
    "orange"=> "3",
    "yellow"=> "4",
    "green"=> "5",
    "blue"=> "6",
    "violet"=> "7",
    "grey"=> "8",
    "white"=> "9"
  }

  def self.value(colors)
    c1, c2 = colors
    (COLOR_TO_VALUE[c1].to_s + COLOR_TO_VALUE[c2].to_s).to_i
  end
end
```

# Hamming

- .`upto(n)` で nまで順に処理していく
- `count {条件式}`　でtrueのカウントをしてくれる

```ruby
module Hamming
  def self.compute(dna_1, dna_2)
    raise ArgumentError if dna_1.length != dna_2.length

    0.upto(dna_1.length).count { |i| dna_1[i] != dna_2[i] }
  end
end
```

# Raindrops

- Hashから条件に一致する要素を選択する　`select`
- valueだけ欲しい場合は `values`
- Stringがemptyの場合のみ、処理するには `gsub` で置換すれば良い

```ruby
module Raindrops
  RAIN_HASH = {
    3 => "Pling",
    5 => "Plang",
    7 => "Plong"
  }.freeze

  def self.convert(number)
	  RAIN_HASH.select { |key, _| number % key == 0}.values.join.gsub(/^$/, number.to_s)
  end
end
```

# Isograms

### 配列に同じ要素が何個あるかを数える

1. array.count(item)

    ```ruby
    l = [1,2,2,1,3]
    l.uniq.map{|item| [item, l.count(item)]}.to_h
    ```

2. `array.group_by(&:itself)`からの`map`

    ```ruby
    l = [1,2,2,1,3]
    l.group_by(&:itself).map{ |k,v| v.size }.to_h
    ```

3. `array.group_by`後に`transform_values`

    ```ruby
    l = [1,2,2,1,3]
    l.group_by(&:itself).transform_values(&:size)
    ```


[配列に同じ要素が何個あるかを数える - patorashのブログ](https://patorash.hatenablog.com/entry/2018/12/06/124628)

# Scrabble

- new
    - インスタンスとクラスに同じ処理を使いたい場合に `new` を使うと良い
- sum
    - Enumeratableオブジェクトに対して、処理した値を加算することができる

    ```ruby
    class Scrabble

      def initialize(letter)
        @letter = letter.nil? ? [] : letter.upcase.split('')
      end

      def score
        return 0 if @letter.nil?
        @letter.sum { |char| SCORES[char] || 0 }
      end

    	# ここで、newを使ってる
      def self.score(letter)
        new(letter).score
      end
    end
    ```


# Gigasecond

- 累乗

    ```ruby
    10 ** 9
    ```


# Clock

- 自作クラスの比較
    - Comparable moduleを利用する（p.297）

```ruby
Class Clock
	include Comparable

	attr_reader :total_minutes


	def <=>(other)
		if other.is_a?(Clock)
			total_miniutes <=> other.total_minute
	end
end
```

# rna_transcription
- 文字列の置換
- `trメソッド`

```ruby
  DNA = 'CATG'
  RNA = 'GUAC'

  def self.of_dna(nucleotides)
    nucleotides.tr(DNA, RNA)
  end
```

# Pangram
### 文字列の空白を削除したい
```ruby
String.gsub(' ', '')
```
参考記事
[文字列中に存在する必要のない空白を削除する方法 - Qiita](https://qiita.com/ntakuya/items/1153940f3e9c6282b4c5)

### a,b,c,...,zの配列を作りたい
```ruby
('a'..'z').to_a
```
参考記事
[アルファベットの配列つくる - Qiita](https://qiita.com/7kaji/items/6e8a38901a5382f03db3)

### 配列が他の配列を含むか確認したい
``` ruby
(sentence.downcase.gsub(' ', '').split('').uniq & ('a'..'z').to_a).size
```
参考記事
[Ruby—配列が別配列の要素を含むかどうかを判定する (配列同士を比較する) - Qiita](https://qiita.com/YumaInaura/items/e597f0a82e1979c9d38f)

### Space Age
- 定数をハッシュで複数定義する
- each文でメソッドを定義する
```ruby
  ORBITAL_PERIODS_IN_EARTH_YEARS.each do |planet, orbital_period|
    define_method('on_' + planet.to_s) { seconds.to_f / (EARTH_YEAR_SECONDS * orbital_period) }
  end
```

# Triangle
### 前提条件をprivate メソッドとして定義する
- 今回の場合は、三角形の成立条件を先に確認しておく
``` ruby
  private

  def triangle?
    side_length.all?(&:positive?) && side_length[2] <= side_length[0] + side_length[1]
  end
```

### 配列の全ての要素のcheckする
- `Array.all?{}`で確認することができる
- 全ての要素が真である場合に `true`を返す。偽である要素があれば、直ちに`false`を返す。


```ruby
  def triangle?
    side_length.all?(&:positive?) && side_length[2] <= side_length[0] + side_length[1]
  end
```
#### 参考記事
[Enumerable#all? (Ruby 3.1 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/method/Enumerable/i/all=3f.html)

### 該当する要素が存在するか確認する
- `Array.ani?{}`で確認する
- 全ての要素が全て偽である場合に偽を返す。真である要素があれば直ちに`true`を返す。

#### 参考記事
[Enumerable#any? (Ruby 3.1 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/method/Enumerable/i/any=3f.html)

### 数値が正であるか確認する
- `positive?`で確認できる

#### 参考記事
[Numeric#positive? (Ruby 3.1 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/method/Numeric/i/positive=3f.html)


# difference_of_squares
- 配列から組み合わせのネストした配列を作成する
- combination

```ruby
  def difference
    (1..num).to_a.combination(2).to_a.sum { |num| num[0] * num[1] } * 2
  end
```
#### 参考記事
[Ruby Arrayの組み合わせ系メソッドまとめ - Qiita](https://qiita.com/shshimamo/items/5a458ecc88e7c24d5112)

# Anagram
- 配列を繰り返し処理でHashを作成する
	- 長さが２の配列に対して、`to_h`メソッドをつかう
```ruby
  def return_hash(word)
    word_arr = word.downcase.chars.map
    word_arr.map { |char| [char, word_arr.count(char)] }.to_h
  end
```

#### 参考記事
[【Ruby】Array から Hash を作る方法７選（a.k.a. やっぱり Array#zip はかわいいよ） | Raksul ENGINEERING](https://tech.raksul.com/2018/02/06/ruby_array_to_hash/)

# Sum of Multiples
### 可変長引数を配列として受け取る
- 引数の先頭に`*`をつけて定義する
``` ruby
  def initialize(*list)
    @list = list
  end
```
#### 参考記事
[Rubyの関数の引数では可変長引数と可変長キーワード引数で便利な使い方ができる - コード日進月歩](https://shinkufencer.hateblo.jp/entry/2018/09/15/230150)

# Transpose
- 文字列の先頭、末尾の空白を削除する
`lstrip`, `rstrip`
#### 参考記事
[空白文字を取り除く - 文字列(String)クラス - Ruby入門](https://www.javadrive.jp/ruby/string_class/index11.html#:~:text=%E6%96%87%E5%AD%97%E5%88%97%E3%81%AE%E5%85%88%E9%A0%AD%E3%82%84,strip%E3%80%8D%E3%83%A1%E3%82%BD%E3%83%83%E3%83%89%E3%82%92%E4%BD%BF%E3%81%84%E3%81%BE%E3%81%99%E3%80%82&text=%E5%85%88%E9%A0%AD%E3%81%A8%E6%9C%AB%E5%B0%BE%E3%81%AE%E7%A9%BA%E7%99%BD,%E3%80%8D%E3%80%8C%C2%A5v%E3%80%8D%E3%81%A7%E3%81%99%E3%80%82)

# Armstrong Numbers
- 引数を基数として数値を配列で返す
[Integer#digits (Ruby 3.1 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/method/Integer/i/digits.html)

# Phone Number
- 正規表現について学習
	- `\`で囲むことによって正規表現を実装
	- `^` ... 先頭の文字を指定する
	- `\d` ... 数字
	- `\D` ... 数字以外
	- `{n,m}` ... 直前の文字やパターンをn回以上m回以下連続する
	- `$` ... 行末を表す
[基本的な正規表現一覧 | murashun.jp](https://murashun.jp/article/programming/regular-expression.html)


# Grains
- デフォルト引数
``` ruby
  def self.total(squares = 64)
    return 2**squares - 1
  end
```

# Resistor Color Trio
- 配列展開
```ruby
	colors = %w[red green yellow]
    c1, c2, c3 = colors
```
- 複数の要素が全て配列に含まれるか確認したい
```ruby
	colors = %w[red green yellow]
    raise ArgumentError unless (@colors - COLOR_TO_VALUE.keys).empty?
```

# ETL
- hashのkey, valueを入れ替える
- `invert`
[[Ruby] 便利な組み込みクラスのメソッド達（Hash編） - Qiita](https://qiita.com/kidach1/items/651b5b5580be40ad047e)

### hashの要素を削除
- `delete(key)`
- [Hash#delete (Ruby 3.1 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/method/Hash/i/delete.html)

### 新しいオブジェクトに対して関数型っぽく処理する
[Enumerable#each_with_object (Ruby 3.1 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/method/Enumerable/i/each_with_object.html)

# Nucleotide Count
### Hash#fetch
- 基本は`Hash#[]`と同じ。keyが存在しない場合の挙動が異なる
  - `Hash#[]`はnilを返す
  - `Hash#fetch`は例外が発生する
- `Hash#fetch`はデフォルト値を指定することができる
  - 第二引数に指定する。keyが存在しない場合は、このデフォルト値を返す.
[Ruby の Hash#fetch が便利 - Qiita](https://qiita.com/siman/items/c3918c6c29770805373d)

# Pythagorean Triplet
### 配列の中から指定個数の要素の組み合わせるを作成する
```ruby
      (min_factor..max_factor)
        .to_a
        .combination(3)
        .each_with_object([]) do |combination, triplets|
          triplet = Triplet.new(*combination)
          triplets << triplet if triplet.pythagorean? && (sum.nil? || triplet.sum == sum)
        end
```
[Array#repeated_combination (Ruby 3.1 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/method/Array/i/repeated_combination.html)
[Ruby Arrayの組み合わせ系メソッドまとめ - Qiita](https://qiita.com/shshimamo/items/5a458ecc88e7c24d5112)

### 引数にデフォルト値を設定する(ハッシュで定義する)
- nilも明記する
- 必須の値を先に指定する
```ruby
  def self.where(max_factor:, min_factor: 1, sum: nil)
  end
```
[ruby引数処理に使えるテクニック - Qiita](https://qiita.com/metheglin/items/306e81c95f8a5cdea296)

### 関数型のsumっぽく積を求める
- `.inject(:*)`を使う
[Ruby 配列内での掛け算 - Qiita](https://qiita.com/mat827/items/7bb9649d4f79a1c45014)

# Collatz Conjecture
- 三項演算子
```ruby
    n.odd? ? steps_helper(3 * n + 1, count + 1) : steps_helper(n / 2, count + 1)
```
### enum_for
- 引数に指定したメソッドを繰り返す？
```ruby
class CollatzConjecture
  def self.steps(num)
    raise ArgumentError, num if num < 1
    enum_for(:each, num).count
  end

  def self.each(num)
    yield num = num.even? ? num / 2 : 3 * num + 1 until num == 1
  end
end
```
# Proverb
### ヒアドキュメントの使い方
[Rubyのヒアドキュメントの書き方いろいろ - Hack Your Design!](https://blog.toshimaru.net/ruby-heredoc/#%E8%AD%98%E5%88%A5%E5%AD%90-1)
### 配列から連続する要素の組み合わせを取得する
- `Array#each_cons(n)`を使う
```ruby
def to_s
	@words
		.each_cons(2)
		.map { |lacked_item, jeopardised_item| "For want of a #{lacked_item} the #{jeopardised_item} was lost." }
		.push("And all for the want of a #{qualifier} #{@words.first}.".squeeze(' '))
		.join("\n")
end
```
[Enumerable#each_cons (Ruby 3.1 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/method/Enumerable/i/each_cons.html)

### 連続する半角スペースを一つにまとめる
- `String.squeeze()`を使う

```ruby
		.push("And all for the want of a #{qualifier} #{@words.first}.".squeeze(' '))
```
- @qualifierがnilの時に、半角スペースが連続するのを一つにまとめた
[String#squeeze (Ruby 3.1 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/method/String/i/squeeze.html)

# Accumulate
- yieldについて
  - 引数に渡されたブロックをメソッド内で活用することができる
  - 引数にブロックが渡されたかどうかは `block_given?` で確認することができる
- ブロックとは？
  - `{}`で囲まれた部分のこと `do end`でも良い
[Rubyのyieldって結局何なの？｜よしだ｜note](https://note.com/yoshidaa_tech/n/ne6f9799eadf4)

# Bob
### 固定のテキストをHashにして整理する
```ruby
  Response = {
    silence: 'Fine. Be that way!',
    yelling: 'Whoa, chill out!',
    asking: 'Sure.',
    statement: 'Whatever.',
    asking_loudly: "Calm down, I know what I'm doing!",
  }
```
### ProcオブジェクトとLambdaについて
-　Procクラスはブロックをオブジェクト化するためのクラス。
	```ruby
	# "Hello!"という文字列を返すProcオブジェクトを作成する
	hello_proc = Proc.new do
		'Hello!'
	end
	# do...endの代わりに{}を使っても良い
	hello_proc = Proc.new {'Hello!'}
	```
- Procオブジェクトを実行するためにはcallメソッド
	```ruby
	hello_proc.call #=> "Hello!"
	```
- 実行時に引数を利用するオブジェクトも定義できる
	```ruby
	add_proc = Proc.new{ |a,b| a + b}
	add_proc.call(10,20) #=> 30
	```
- デフォルト値をつけることもできる
	```ruby
	add_proc = Proc.new{ |a = 0, b = 0| a + b }
	add_proc.call #=> 0
	add_proc.call(10) #=> 10
	add_proc.call(10,20) #=> 30
	```
- Procオブジェクトを作成する場合は、`Proc.new`だけでなく、Kernelモジュールのprocメソッドを使うこともできる
	```ruby
	add_proc = proc {|a,b| a + b}
	```
### Procオブジェクトを作成する方法
1. Procクラスの利用
   - `Proc.new {|a,b| a+b]`
1. Kernelモジュールのprocメソッドを利用
   - `proc {|a,b| a+b]}`
1. -> 構文
   - `->(a,b) {|a,b| a + b}`
1. lambdaメソッド
   -　`lambda {|a,b| a + b}`

# Nth-prime
- n番目の素数を求める
- エラトステネスの篩を使う（参照：蟻本p112）
### 手順
1. boolの配列 `is_prime`を用意
2. is_prime[0], is_prime[1]をfalse
3. for文で is_prime[i]がtrueならそれは素数。i*2以上のiの倍数jについて `is_prime[j] = false`と変換する

# Protein-translation
`to_sym`でStringをシンボルに変換できる

# allergies
- `map.with_index`
- `Array#include?`

# Rail-Fence-cipher
### クラスメソッドをprivateにしたい
- `private_class_method` を使う

```ruby
  def self.zigzag(num, size)
    pattern = (0..num - 1).to_a + (1..num - 2).to_a.reverse
    pattern.cycle.first(size).zip(0..size)
  end

  private_class_method :zigzag
```

### Array#cycle
- 配列の全要素をn回(nilの場合は無限回)繰り返しブロックを呼び出す
- ブロックを省略した場合は Enumerator を返す。
ref: [Array#cycle (Ruby 3.1 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/method/Array/i/cycle.html)

### Enumerable#first
- Enumerable オブジェクトの最初の要素、もしくは最初の n 要素を返します。
- Enumerable オブジェクトが空の場合、引数を指定しない形式では nil を返します。引数を指定する形式では、空の配列を返します。
ref: [Enumerable#first (Ruby 3.1 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/method/Enumerable/i/first.html)

### Array#zip
- 自身と引数に渡した配列の各要素からなる配列の配列を生成して返す。生成される配列の要素数は`self`の要素数と同じ
- ブロック付きで呼び出したい場合は、`self`と引数に渡した配列の各要素を順番にブロックに渡す

```ruby
  def self.zigzag(num, size)
    pattern = (0..num - 1).to_a + (1..num - 2).to_a.reverse
    pattern.cycle.first(size).zip(0..size)
  end
```


# Run Length Encodign
### String#gsub
- `gsub(pattern) {|matched| ...} -> String`
  - 文字列中でパターンにマッチした部分を順番にブロックに渡し、その実行結果で置き換えた文字列を生成して返す
[String#gsub (Ruby 3.1 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/method/String/i/gsub.html)

### 正規表現
- `\1`
  - `()` で囲んだ正規表現にマッチした文字列(グループ)を参照することができる `\`の後の数字は何番目の`()`かを指定している
- ex) 同じ文字が２文字以上続く
  - `(.)\1+`
	- `.`は任意の１文字
[とほほの正規表現入門 - とほほのWWW入門](https://www.tohoho-web.com/ex/regexp.html)

# Mine Sweeper
### each_with_index
### each.with_index

# Robot Simulator
### freeze
### rotate!

### 引数名をhashにする

# LocomotiveEngineer
- 任意のキーワードを受け付けたい

```ruby:locomotive_engineer.rb
	# 任意のキーワードを引数に取る **
  def self.add_missing_stops(routing_hash, **stops)
    {**routing_hash, stops: [*stops.values]}
  end
```

# SecretHandshake
## バイナリー表記したい
- `0b`を先頭に表記することで表現できる
```ruby
0b1   # 1
0b10  # 2
0b110 # 3
```

- Hashでキーをintegerにする　=> Arrayで問題ない

# Atbash
- `each_slice`
	- n 要素ずつブロックに渡して繰り返します。
		要素数が n で割り切れないときは、最後の回だけ要素数が減ります。
		ブロックを省略した場合は n 要素ずつ繰り返す Enumerator を返します。
- 正規表現 `/\W/`
  - 非単語構成文字
  - `\w`が、単語構成文字(a-zA-Z_0-9)
- `tr(arr_a, arr_b)`
	- [String#tr (Ruby 3.2 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/method/String/i/tr.html)