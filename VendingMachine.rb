class SlotMoney

  # 初期化。投入金額を0円にする
  def initialize
    @slot_money = 0    # 自販機に反映される、投入金額
    @change_money = 0  # お釣りの金額
  end

  # 投入できるお金を設定する。.freezeによって、値が変わることを防ぐ
  MONEY = [10, 50, 100, 500, 1000].freeze

  # 入金と、払い戻しの仕組み
  def slot_money   
    puts "a:入金を止める, 半角数字:お金を入れる"
    while true #投入を複数回できる仕組み
      input = gets.chomp 
      return false if input == "a"  #aならfalseになり、繰り返しを止める
      money = input.to_i
      if MONEY.include?(money)  #もしMONEY（配列）の数字が含まれていたら
        @slot_money += money    #投入金額を増やしていく
      elsif input =~ /^[0-9]+$/
        @change_money += money  #お釣りの額を増やしていく
      else
        puts "aまたは半角数字を入力してください"
      end
    end
  end

  #現在の投入金額
  def current_slot_money
    @slot_money
  end
  
  #お釣りの金額
  def change_money
    @change_money
  end
end

class VendingMachine
  def initialize(slot_money)
    # drink_name = []      #ドリンクネームの初期化
    @slot_money = slot_money
    @sales = 0         # 売上の金額
    default_stock = 5
    @drinks = [{drink: "コーラ", price: 120, stock: default_stock},   
               {drink: "レッドブル", price: 200, stock: default_stock},
               {drink: "水", price: 100, stock: default_stock}]
  end

  #配列にして、データを挿入
  def drink_list
    @drinks
  end

  def buy_drink
    puts "購入したい商品名を入力してください。"
    puts "払い戻す場合は、aを押してください"
    drink_list.each_with_index do | drink, index |
      puts "#{index}:#{drink[:drink]}:#{drink[:price]}円"
    end

    input_buy_drink = gets.chomp
    drink_kinds = drink_list.length - 1

    array = ["a", *"0".."#{drink_kinds}"]

    if (array).include?(input_buy_drink) 

      if input_buy_drink == "a"
        # 払い戻し
        puts "払い戻し" 

      else
        input_buy_drink = input_buy_drink.to_i
        drink = @drinks[input_buy_drink][:drink]
        price = @drinks[input_buy_drink][:price]
        stock = @drinks[input_buy_drink][:stock]

        if @slot_money >= price && stock > 0
          @slot_money = @slot_money - price
          @drinks[input_buy_drink][:stock] = stock -1
          @sales += price

          puts "お買い上げありがとうございました。\n商品　:#{drink}\nお釣り:#{@slot_money}円\n売上　:#{@sales}円"
        else
          puts "購入できませんでした。"
          puts "お金が足りません。残高：#{@slot_money}円"  if @slot_money < price
          puts "#{drink}は売り切れです。"  if stock <= 0
        end
      end
    end
  end
end

# 実行
money = SlotMoney.new
money.slot_money
slot_money = money.current_slot_money

vending_machine = VendingMachine.new(slot_money)
vending_machine.buy_drink