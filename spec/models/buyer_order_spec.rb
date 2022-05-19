require 'rails_helper'

RSpec.describe BuyerOrder, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buyer_order = FactoryBot.build(:buyer_order, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  context '商品を購入できる時' do
    it '正しい情報を入力すれば購入できる' do
      expect(@buyer_order).to be_valid
    end
    it 'buildingを入力しなくても購入できる' do
      @buyer_order.building = ""
      expect(@buyer_order).to be_valid
    end
  end
  context '商品を購入できない時' do
    it 'tokenが空だと購入できない' do
      @buyer_order.token = ""
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("クレジットカード情報を入力してください")
    end
    it 'postal_codeが空だと購入できない' do
      @buyer_order.postal_code = ""
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("郵便番号を入力してください")
    end
    it 'municipalitiesが空だと購入できない' do
      @buyer_order.municipalities = ""
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("市町村を入力してください")
    end
    it 'addressが空だと購入できない' do
      @buyer_order.address = ""
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("番地を入力してください")
    end
    it 'telが空だと購入できない' do
      @buyer_order.tel = ""
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("電話番号を入力してください")
    end
    it 'telが9桁以下だと購入できない' do
      @buyer_order.tel = "123456789"
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("電話番号が不正です 半角数字で入力してください")
    end
    it 'telが12桁以上だと購入できない' do
      @buyer_order.tel = "123456789012"
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("電話番号が不正です 半角数字で入力してください")
    end
    it 'postal_codeが7文字の半角数字でないと購入できない' do
      @buyer_order.postal_code = "１２３-１２３４"
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("郵便番号が不正です ハイフン（-）を入力してください")
    end
    it 'postal_codeにハイフンが含まれていないと購入できない' do
      @buyer_order.postal_code = "1234567"
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("郵便番号が不正です ハイフン（-）を入力してください")
    end
    it 'telが11文字の半角数字でないと購入できない' do
      @buyer_order.tel = Faker::Lorem.sentence
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("電話番号が不正です 半角数字で入力してください")
    end
    it 'prefectureに「---」が選択されていると購入できない' do
      @buyer_order.prefecture_id = "1"
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("都道府県を入力してください")
    end
    it 'userが紐づいていないと購入できない' do
      @buyer_order.user_id = nil
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("Userを入力してください")
    end
    it 'itemが紐づいていないと購入できない' do
      @buyer_order.item_id = nil
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("Itemを入力してください")
    end
  end
end
