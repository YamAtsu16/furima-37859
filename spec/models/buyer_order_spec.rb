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
      expect(@buyer_order.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空だと購入できない' do
      @buyer_order.postal_code = ""
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'municipalitiesが空だと購入できない' do
      @buyer_order.municipalities = ""
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("Municipalities can't be blank")
    end
    it 'addressが空だと購入できない' do
      @buyer_order.address = ""
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("Address can't be blank")
    end
    it 'tellが空だと購入できない' do
      @buyer_order.tell = ""
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("Tell can't be blank")
    end
    it 'tellが9桁以下だと購入できない' do
      @buyer_order.tell = "123456789"
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("Tell is invalid")
    end
    it 'tellが12桁以上だと購入できない' do
      @buyer_order.tell = "123456789012"
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("Tell is invalid")
    end
    it 'postal_codeが7文字の半角数字でないと購入できない' do
      @buyer_order.postal_code = "１２３-１２３４"
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'postal_codeにハイフンが含まれていないと購入できない' do
      @buyer_order.postal_code = "1234567"
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'tellが11文字の半角数字でないと購入できない' do
      @buyer_order.tell = Faker::Lorem.sentence
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("Tell is invalid")
    end
    it 'prefectureに「---」が選択されていると購入できない' do
      @buyer_order.prefecture_id = "1"
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'userが紐づいていないと購入できない' do
      @buyer_order.user_id = nil
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("User can't be blank")
    end
    it 'itemが紐づいていないと購入できない' do
      @buyer_order.item_id = nil
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("Item can't be blank")
    end
  end
end
