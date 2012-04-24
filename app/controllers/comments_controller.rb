class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index
    @comments = Photo.find(params[:photo_id]).comments

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Photo.find(params[:photo_id]).comments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Photo.find(params[:photo_id]).comments.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Photo.find(params[:photo_id]).comments.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Photo.find(params[:photo_id]).comments.new(params[:comment])
    @comment.ip = request.ip

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.photo, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Photo.find(params[:photo_id]).comments.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Photo.find(params[:photo_id]).comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to photo_comments_url }
      format.json { head :ok }
    end
  end
end
