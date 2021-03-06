class ReverseController < ApplicationController
  before_action :authenticate_user!
  before_action :check_opened, :only => [:level1, :level2, :level3, :level4, :level5]

  def index
    @reverse_outlines = Reverse.attributes
  end

  def level1
    @ranked_players = Array.new
    Record.all.where(cate: 'r1').order(solved: :desc, finish_time: :asc).includes(:user => :record).each do |r|
      if r.user.id != 1
        @ranked_players << r.user
      end
    end
    @url = Reverse.url(1).first.url
    @chal = Reverse.find_by_id(1)
    @hint = Hint.hint('r1').empty? ? "Empty here!" : Hint.hint('r1').first.hint
    @user = current_user
    @userpass = user_params[:flag]
    @pass = Digest::SHA1.hexdigest(Reverse.flag(1).first.flag)
    if !@userpass.nil?
      @userpass = Digest::SHA1.hexdigest @userpass
      @user.record.find_by_cate('r1').update(last_try_time: DateTime.current)
      if @userpass == @pass
        @user.last_submit_time = @user.record.find_by_cate('r1').last_try_time
        if !@user.record.find_by_cate('r1').solved
          @user.score += 100
          @user.record.find_by_cate('r1').update(solved: true, score: @user.score)
          if @user.save
            flash[:alert] = 'Congratulations!'
            @user.record.find_by_cate('r1').update(finish_time: @user.last_submit_time)
            redirect_to wargame_reverse_path
          else
            render 'reverse/level1'
          end
        else
          flash[:alert] = 'You\'ve passed the problem!'
          redirect_to wargame_reverse_path
        end
      else
        flash[:alert] = 'Failed! Maybe try again?'
        render 'reverse/level1'
      end
    end
  end

  def level2
    @ranked_players = Array.new
    Record.all.where(cate: 'r2').order(solved: :desc, finish_time: :asc).includes(:user => :record).each do |r|
      if r.user.id != 1
        @ranked_players << r.user
      end
    end
    @url = Reverse.url(2).first.url
    @chal = Reverse.find_by_id(2)
    @hint = Hint.hint('r2').empty? ? "Empty here!" : Hint.hint('r2').first.hint
    @user = current_user
    @userpass = user_params[:flag]
    @pass = Digest::SHA1.hexdigest(Reverse.flag(2).first.flag)
    if !@userpass.nil?
      @userpass = Digest::SHA1.hexdigest @userpass
      @user.record.find_by_cate('r2').update(last_try_time: DateTime.current)
      if @userpass == @pass
        @user.last_submit_time = @user.record.find_by_cate('r2').last_try_time
        if !@user.record.find_by_cate('r2').solved
          @user.score += 200
          @user.record.find_by_cate('r2').update(solved: true, score: @user.score)
          if @user.save
            flash[:alert] = 'Congratulations!'
            @user.record.find_by_cate('r2').update(finish_time: @user.last_submit_time)
            redirect_to wargame_reverse_path
          else
            render 'reverse/level2'
          end
        else
          flash[:alert] = 'You\'ve passed the problem!'
          redirect_to wargame_reverse_path
        end
      else
        flash[:alert] = 'Failed! Maybe try again?'
        render 'reverse/level2'
      end
    end
  end

  def level3
    @ranked_players = Array.new
    Record.all.where(cate: 'r3').order(solved: :desc, finish_time: :asc).includes(:user => :record).each do |r|
      if r.user.id != 1
        @ranked_players << r.user
      end
    end
    @url = Reverse.url(3).first.url
    @chal = Reverse.find_by_id(3)
    @hint = Hint.hint('r3').empty? ? "Empty here!" : Hint.hint('r3').first.hint
    @user = current_user
    @userpass = user_params[:flag]
    @pass = Digest::SHA1.hexdigest(Reverse.flag(3).first.flag)
    if !@userpass.nil?
      @userpass = Digest::SHA1.hexdigest @userpass
      @user.record.find_by_cate('r3').update(last_try_time: DateTime.current)
      if @userpass == @pass
        @user.last_submit_time = @user.record.find_by_cate('r3').last_try_time
        if !@user.record.find_by_cate('r3').solved
          @user.score += 300
          @user.record.find_by_cate('r3').update(solved: true, score: @user.score)
          if @user.save
            flash[:alert] = 'Congratulations!'
            @user.record.find_by_cate('r3').update(finish_time: @user.last_submit_time)
            redirect_to wargame_reverse_path
          else
            render 'reverse/level3'
          end
        else
          flash[:alert] = 'You\'ve passed the problem!'
          redirect_to wargame_reverse_path
        end
      else
        flash[:alert] = 'Failed! Maybe try again?'
        render 'reverse/level3'
      end
    end
  end

  def level4
    @ranked_players = Array.new
    Record.all.where(cate: 'r4').order(solved: :desc, finish_time: :asc).includes(:user => :record).each do |r|
      if r.user.id != 1
        @ranked_players << r.user
      end
    end
    @url = Reverse.url(4).first.url
    @chal = Reverse.find_by_id(4)
    @hint = Hint.hint('r4').empty? ? "Empty here!" : Hint.hint('r4').first.hint
    @user = current_user
    @userpass = user_params[:flag]
    @pass = Digest::SHA1.hexdigest(Reverse.flag(4).first.flag)
    if !@userpass.nil?
      @userpass = Digest::SHA1.hexdigest @userpass
      @user.record.find_by_cate('r4').update(last_try_time: DateTime.current)
      if @userpass == @pass
        @user.last_submit_time = @user.record.find_by_cate('r4').last_try_time
        if !@user.record.find_by_cate('r4').solved
          @user.score += 400
          @user.record.find_by_cate('r4').update(solved: true, score: @user.score)
          if @user.save
            flash[:alert] = 'Congratulations!'
            @user.record.find_by_cate('r4').update(finish_time: @user.last_submit_time)
            redirect_to wargame_reverse_path
          else
            render 'reverse/level4'
          end
        else
          flash[:alert] = 'You\'ve passed the problem!'
          redirect_to wargame_reverse_path
        end
      else
        flash[:alert] = 'Failed! Maybe try again?'
        render 'reverse/level4'
      end
    end
  end

  def level5
    @ranked_players = Array.new
    Record.all.where(cate: 'r5').order(solved: :desc, finish_time: :asc).includes(:user => :record).each do |r|
      if r.user.id != 1
        @ranked_players << r.user
      end
    end
    @url = Reverse.url(5).first.url
    @chal = Reverse.find_by_id(5)
    @hint = Hint.hint('r5').empty? ? "Empty here!" : Hint.hint('r5').first.hint
    @user = current_user
    @userpass = user_params[:flag]
    @pass = Digest::SHA1.hexdigest(Reverse.flag(5).first.flag)
    if !@userpass.nil?
      @userpass = Digest::SHA1.hexdigest @userpass
      @user.record.find_by_cate('r5').update(last_try_time: DateTime.current)
      if @userpass == @pass
        @user.last_submit_time = @user.record.find_by_cate('r5').last_try_time
        if !@user.record.find_by_cate('r5').solved
          @user.score += 500
          @user.record.find_by_cate('r5').update(solved: true, score: @user.score)
          if @user.save
            flash[:alert] = 'Congratulations!'
            @user.record.find_by_cate('r5').update(finish_time: @user.last_submit_time)
            redirect_to wargame_reverse_path
          else
            render 'reverse/level5'
          end
        else
          flash[:alert] = 'You\'ve passed the problem!'
          redirect_to wargame_reverse_path
        end
      else
        flash[:alert] = 'Failed! Maybe try again?'
        render 'reverse/level5'
      end
    end
  end

  def content_save
    @chal = Reverse.find_by(:id => params[:reverse][:id])
    @chal.content = params[:reverse][:content].gsub(/\'/, "&#39;").gsub(/(\r)+\n/, "")
    if !!@chal.save
      respond_to do |format|
        format.js { render partial: "shared/challenge_content_save" }
      end
    end
  end

  def content_edit
    @chal = Reverse.find_by(:id => params[:reverse][:id])
    respond_to do |format|
      format.js { render partial: "shared/challenge_content_edit" }
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.permit(:flag)
  end

  def check_opened
    @tmp = controller_name.clone
    @tmp[0] = @tmp[0].capitalize
    @flag = @tmp.constantize.opened? action_name[-1]
    if (not current_user.admin?) && (@flag != true)
      flash[:alert] = 'Not yet ready!'
      redirect_to (request.referer or home_path)
    end
  end
end