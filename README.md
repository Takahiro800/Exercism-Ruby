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