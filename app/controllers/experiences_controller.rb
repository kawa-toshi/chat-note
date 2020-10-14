class ExperiencesController < ApplicationController

  def index
    # @data = { "2020-01-01" => 100,"2020-01-02" => 80}
    @experience = current_user.experiences
    # @day = Date.today 
    # @experience1 = @number.where(created_at: @day)
    # @experience = Experience.all
    @exp = Experience.where(created_at: Date.today.all_day)

    
    @experience.each do |experience| # each文でレコードを分ける。
      if (experience[:created_at].to_s.match(/#{Date.today.to_s}.+/)) 
    # Date.todayは、今日の年月日を取得できる。matchメソッドを使用し、hogeのレコード内に今日の年月日があるかどうか確認。
    # to_sで文字列に変換しているのは、matchメソッドは文字列にしか適用できないため。
        @data = experience[:number]  # レコードが今日に相当すれば、@dataに数字を代入。
        @experience1 = experience
      end

# hoge[:created_at]がJSTになっていない場合は、以下のようにしてJSTに変更できる。
# hoge_jst = hoge[:created_at].in_time_zone('Tokyo')

  end
end

  def new
    @experience = Experience.new
  end

  def create
    Experience.create!(experience_params)
    flash[:notice] = "数字が作成されました"
    redirect_to root_path
  end

  def edit
    @experience = Experience.find(params[:id])
  end

  def update
    experience = Experience.find(params[:id])
    experience.update(experience_params)
    flash[:notice] = "話した人数は更新されました"
    redirect_to root_path
  end

  def destroy
    experience = Experience.find(params[:id])
    experience.destroy
    flash[:notice] = "今日話した人数は削除されました"
    redirect_to root_path
  end

  private
  def experience_params
    params.require(:experience).permit(:number).merge(user_id: current_user.id)
  end
end
