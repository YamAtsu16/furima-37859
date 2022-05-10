require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができる時' do
    it '正しい情報を入力すれば新規登録ができる' do
      # トップページに移動する
      # トップページに新規登録ボタンがあることを確認する
      # 新規登録ボタンをクリックし、新規登録ページへ移動する
      # ユーザー情報を入力する
      # 会員登録ボタンをクリックすると、ユーザーモデルのカウントが１上がるのを確認する
      # トップページへ移動したことを確認する
      # ログアウトボタン及びユーザー名が表示されていることを確認する
      # ログインボタン及び新規登録ボタンがないことを確認する
    end
  end
  context 'ユーザー新規登録ができるない時' do
    it '誤った情報を入力すると新規登録できずに新規登録ページに戻ってくる' do
      # トップページに移動する
      # トップページに新規登録ボタンがあることを確認する
      # 新規登録ボタンをクリックし、新規登録ページへ移動する
      # ユーザー情報を入力する
      # 会員登録ボタンをクリックしても、ユーザーモデルのカウントが上がらないのを確認する
      # 新規登録ページへ戻ってきたことを確認する
    end
  end
end