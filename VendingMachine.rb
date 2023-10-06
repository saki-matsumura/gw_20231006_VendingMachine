class VendingMachine
  # 投入できるお金を設定する。.freezeによって、値が変わることを防ぐ
  MONEY = [10, 50, 100, 500, 1000].freeze

  # 初期化。投入金額を0円にする
  def initialize
    @slot_money = 0
  end

  # 合計金額だけを出力する
  def current_slot_money
    @slot_money
  end

  # 投入金額を足していくメゾット
  def slot_money(money)
    return false unless MONEY.include?(money)
    @slot_money += money
  end

  # お釣りの値を返す
  def return_money
    puts @slot_money
    @slot_money = 0
  end
end

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

vm = VendingMachine.new
vm.slot_money(100)
p vm.current_slot_money
