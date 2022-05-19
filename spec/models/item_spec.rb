require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品出品ができるとき' do
    it '入力項目が全て入力されていると登録できる' do
      expect(@item).to be_valid
    end
  end
  context '商品出品ができないとき' do
    it 'nameが空だと出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end
    it 'textが空だと出品できない' do
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の説明を入力してください")
    end
    it 'imageが空だと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品画像を入力してください")
    end
    it 'priceが空だと出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("価格を入力してください")
    end
    it 'カテゴリーに「---」が選択されている場合は出品できない' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
    end
    it '商品の状態に「---」が選択されている場合は出品できない' do
      @item.condition_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("商品状態を入力してください")
    end
    it '配送料の負担に「---」が選択されている場合は出品できない' do
      @item.delivery_charge_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
    end
    it '発送元の地域に「---」が選択されている場合は出品できない' do
      @item.prefecture_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
    end
    it '発送までの日数に「---」が選択されている場合は出品できない' do
      @item.shipping_date_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("発送までの日時を入力してください")
    end
    it 'priceが半角数字でないと出品できない' do
      @item.price = Faker::Lorem.sentence
      @item.valid?
      expect(@item.errors.full_messages).to include('価格は数値で入力してください')
    end
    it 'priceが300以上でないと出品できない' do
      @item.price = Faker::Number.between(from: 0, to: 299)
      @item.valid?
      expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
    end
    it 'priceが9999999以下でないと出品できない' do
      @item.price = Faker::Number.between(from: 100_000_000, to: 999_000_000)
      @item.valid?
      expect(@item.errors.full_messages).to include('価格は9999999以下の値にしてください')
    end
    it 'userが紐づいていないと出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Userを入力してください')
    end
  end
end
