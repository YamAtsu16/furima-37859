require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context '新規登録できるとき' do
    it '入力項目が全て入力されていると登録できる' do
      expect(@user).to be_valid
    end
  end
  context '新規登録できないとき' do
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end
    it 'emailが空だと登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end
    it 'passwordが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end
    it 'birthdayが空だと登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("生年月日を入力してください")
    end
    it 'last_nameが空だと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字を入力してください")
    end
    it 'first_nameが空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください")
    end
    it 'last_name_kanaが空だと登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字（カナ）を入力してください")
    end
    it 'first_name_kanaが空だと登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前（カナ）を入力してください")
    end
    it 'すでに登録されているemailは登録できない' do
      @user.save
      @user_2 = FactoryBot.build(:user)
      @user_2.email = @user.email
      @user_2.valid?
      expect(@user_2.errors.full_messages).to include('Eメールはすでに存在します')
    end
    it 'passwordが5文字以下だと登録できない' do
      @user.password = '1234a'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end
    it 'passwordとpassword_confirmationが一致しないと登録できない' do
      @user.password = '12345a'
      @user.password_confirmation = '12345b'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it 'passwordが数字のみだと登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは不正な値です')
    end
    it 'passwordが英語のみだと登録できない' do
      @user.password = 'abcdefg'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは不正な値です')
    end
    it 'last_nameが漢字,ひらがな,カタカナ以外だと登録できない' do
      @user.last_name = 'hege'
      @user.valid?
      expect(@user.errors.full_messages).to include('苗字は不正な値です')
    end
    it 'first_nameが漢字,ひらがな,カタカナ以外だと登録できない' do
      @user.first_name = 'hege'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前は不正な値です')
    end
    it 'last_name_kanaがカタカナ以外だと登録できない' do
      @user.last_name_kana = 'ほげ'
      @user.valid?
      expect(@user.errors.full_messages).to include('苗字（カナ）は不正な値です')
    end
    it 'first_name_kanaがカタカナ以外だと登録できない' do
      @user.first_name_kana = 'ほげ'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前（カナ）は不正な値です')
    end
    it 'emailに@が含まれていないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
    end
    it 'passwordに全角文字が含まれていると登録できない' do
      @user.password = 'テストパスワード'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは不正な値です')
    end
  end
end
