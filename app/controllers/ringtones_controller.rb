class RingtonesController < ApplicationController
   autocomplete :tag, :name, class_name: "ActsAsTaggableOn::Tag"
   # autocomplete :ringtone, :tag#, display_value: :tag_list_to_autocomplete
   # autocomplete :ringtone, :name#, display_value: :tag_list_to_autocomplete

  # GET /ringtones
  # GET /ringtones.json
  def index
    # @ringtones = Ringtone.all
    # binding.pry
    if params[:tag]
      # @ringtones = Ringtone.tagged_with(params[:tag])
      @ringtones = Ringtone.tagged_with(params[:tag]).page(params[:page]).per(6)
    else
      @ringtones = Ringtone.order(:name).page(params[:page]).per(6)
      # @results = Kaminari.paginate_array(Ringtone.all).page(params[:page])
      # @ringtones = Ringtone.all
    end
    # binding.pry
    respond_to do |format|
      format.js #index.js.erb
      format.html # index.html.erb
      format.json { render json: @ringtones }
    end
  end
  
  # GET /ringtones/1
  # GET /ringtones/1.json
  def show
    @ringtone = Ringtone.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ringtone }
    end
  end

  # GET /ringtones/new
  # GET /ringtones/new.json
  def new
    @ringtone = Ringtone.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ringtone }
      format.js
    end
  end

  # GET /ringtones/1/edit
  def edit
    @ringtone = Ringtone.find(params[:id])
  end

  # POST /ringtones
  # POST /ringtones.json
  def create
    # binding.pry
    @ringtone = Ringtone.new(params[:ringtone])
    respond_to do |format|
      if @ringtone.save
        format.html { redirect_to @ringtone, notice: 'Ringtone was successfully created.' }
        format.json { render json: @ringtone, status: :created, location: @ringtone }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @ringtone.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /ringtones/1
  # PUT /ringtones/1.json
  def update
    # binding.pry
    @ringtone = Ringtone.find(params[:id])

    respond_to do |format|
      if @ringtone.update_attributes(params[:ringtone])
        format.html { redirect_to @ringtone, notice: 'Ringtone was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ringtone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ringtones/1
  # DELETE /ringtones/1.json
  def destroy
    @ringtone = Ringtone.find(params[:id])
    @ringtone.destroy

    respond_to do |format|
      format.html { redirect_to ringtones_url }
      format.json { head :no_content }
      format.js
    end
  end

  def updatetaglist
    @ringtone = Ringtone.find(params[:id])

    respond_to do |format|
      format.js 
    end
  end

  def tagcloud
    # turn the html links with heler
    # binding.pry
    respond_to do |format|
      # 注意这里不能用 _tag_cloud.html.erb， 带下划线的只是在render patrial的时候才能用哈
      # 实际使用下面这种语法，否则会连layout 一起渲染
      format.html { render partial: "tagcloud", layout: false }
    end
  end

  def taglist
    @ringtone = Ringtone.find(params[:id])

    respond_to do |format|
      format.html { render partial: "taglist", layout: false }
    end
  end

    # binding.pry
    # params['attachment'].each do |a|
    #   puts a.original_filename
    #   new_ringtone = Ringtone.new
    #   new_ringtone.name = a.original_filename
    #   new_ringtone.tag_list = "Todo"
    #   new_ringtone.save
    # end
  def multiupload
    # this will be trigger the each time when a file is upload 
    # binding.pry
    @ringtone = Ringtone.new
    a = params[:attachment].as_json()[0]
    @ringtone.name = a['original_filename']
    @ringtone.attachment = params[:attachment][0] # use console to look it 
    @ringtone.tag_list = "ToDo"
    # binding.pry
    @ringtone.save
      
    respond_to do |format|
      format.js
    end
  end

  def sidebarform
    respond_to do |format|
      format.html { render partial: "multiupload", layout: false }
    end
    
  end

end


