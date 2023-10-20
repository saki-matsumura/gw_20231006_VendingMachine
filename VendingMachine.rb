class SlotMoney
  # 初期化。投入金額を0円にする
  def initialize
    @slot_money = 0
    @change_money = 0
  end

  MONEY = [10, 50, 100, 500, 1000].freeze

  def slot_money
    puts "a:入金を止める, 半角数字:お金を入れる"
    while true 
      input = gets.chomp 
      return false if input == "a"
      money = input.to_i
      if MONEY.include?(money)
        @slot_money += money
      elsif input =~ /^[0-9]+$/
        @change_money += money
      else
        puts "aまたは半角数字を入力してください"
      end
    end
  end

  def current_slot_money
    @slot_money
  end
  
  def change_money
    @change_money
  end
end

class VendingMachine
  # 投入できるお金を設定する。.freezeによって、値が変わることを防ぐ
  def initialize
    drink_name = []
  end

  def drink_list
  drinks = [{drink: "コーラ", price: 120, stock: 5},
            {drink: "レッドブル", price: 200, stock: 5},
            {drink: "水", price: 100, stock: 5}]

  end

  def buy_drink(current_slot_money)
    # current_slot_maneyと、全ての飲み物のpriceを比較して、
    # current_slot_maney >= priceになる商品だけ並べる
    can_buy_drink = []
    can_buy_drink_name = []
    
    drink_list.each do | drink |
      if current_slot_money >= drink[:price] && drink[:stock] > 0
          can_buy_drink << drink
          can_buy_drink_name << drink[:drink]
      end
    end

    puts "購入したい商品名を入力してください。"
    can_buy_drink.each do | list |
      puts "#{list[:drink]}:#{list[:price]}円"
    end

    input_buy_drink = gets.chomp

    if can_buy_drink_name.include?(input_buy_drink)
      puts "一致しています！"
    end

    # can_buy_drink
    # binding.irb

    # 並んだ商品の番号（id？）を選択すると、購入できる
    
    # 買った商品に応じて、売上が加算される

    # if current_slot_money
  # end

  # # お釣りの値を返す
  # def return_money
  #   puts @slot_money
  #   @slot_money = 0
  # end
  end
end

# ————————————————————————————————————————
# 実行テスト
# ————————————————————————————————————————

# slot = SlotMoney.new
# slot.slot_money

# current_slot_money = slot.current_slot_money
# change_money = slot.change_money

# puts "使えるお金:#{cs_maney}円"
# puts "そのままお釣りになるお金:#{ch_maney}円"

vending_machine = VendingMachine.new
drink = vending_machine.buy_drink(500)
puts drink

# ————————————————————————————————————————

# step2
# ・商品の情報を入れるメソッド？が必要そう
# 　{[drink:"コーラ"],[price:120],[stock:5]},{[drink:"レッドブル"],[price:120],[stock:5]}

# step3
# ・買えるかどうかの判定
#  ifでcurrent_slot_money>=コーラのpriceだったら、購入可能

# ・購入されたら、stockを減らす

# ・売上金額を合計するメソッドが必要そう

# ・@slot_moneyから、購入した金額分差し引くメソッドが必要そう

# step4
# ・商品の情報に他の飲み物の情報を追加する
# ・購入可能な商品一覧を出力するメソッドが必要そう

# step5
# ・お釣りを正確に出力するメソッドが必要そう

# - - - - - - -
# 必要なもの
# ▼ メソッド
# ・
# ▼ 変数
# ・商品（ハッシュ）
# ・売上合計

# ————————————————————————————————————————
