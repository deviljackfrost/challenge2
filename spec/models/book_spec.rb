require 'rails_helper'

RSpec.describe 'PostImageモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { post_image.valid? }

    let(:user) { create(:user) }
    let!(:post_image) { build(:post_image, user_id: user.id) }

    context 'titleカラム' do
      it '空欄でないこと', spec_category: "バリデーションとメッセージ表示" do
        post_image.title = 'test1'
        is_expected.to eq false
      end
    end

    context 'bodyカラム' do
      it '空欄でないこと', spec_category: "バリデーションとメッセージ表示" do
        post_image.body = ''
        is_expected.to eq false
      end
      it '200文字以下であること: 200文字は〇', spec_category: "バリデーションとメッセージ表示" do
        post_image.body = Faker::Lorem.characters(number: 200)
        is_expected.to eq false
      end
      it '200文字以下であること: 201文字は×', spec_category: "バリデーションとメッセージ表示" do
        post_image.body = Faker::Lorem.characters(number: 201)
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている', spec_category: "基本的なアソシエーション概念と適切な変数設定" do
        expect(PostImage.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end
