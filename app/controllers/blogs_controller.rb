class BlogsController < ApplicationController
uses_tiny_mce(:options => AppConfig.default_mce_options, :only => [:new, :edit, :index])
  # GET /blogs
  # GET /blogs.xml
  def index    
		@blogs =Blog.find(:all, :order =>"id DESC")
		@blog  = Blog.new
		
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @blogs }
			format.xml  { render :xml => @blog }
			
    end
  end

  # GET /blogs/1
  # GET /blogs/1.xml
  def show
    @blog = Blog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @blog }
    end
  end

  # GET /blogs/new
  # GET /blogs/new.xml
  def new
    @blog = Blog.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @blog }

    end
  end

  # GET /blogs/1/edit
  def edit
    @blog = Blog.find(params[:id])
  end

  # POST /blogs
  # POST /blogs.xml
  def create

    @blog = Blog.new(params[:blog])
          if @blog.save
            redirect_to blogs_path
             # flash[:notice] = 'Blog was successfully created.'
             # format.html { redirect_to(@blog) }
             # format.xml  { render :xml => @blog, :status => :created, :location => @blog }
          else
            respond_to do |format|
            format.html { render :action => "new" }
            format.xml  { render :xml => @blog.errors, :status => :unprocessable_entity }
            end
        end
  end

  # PUT /blogs/1
  # PUT /blogs/1.xml
  def update
    @blog = Blog.find(params[:id])

    respond_to do |format|
      if @blog.update_attributes(params[:blog])
        flash[:notice] = 'Blog was successfully updated.'
        format.html { redirect_to blogs_path() }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @blog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.xml
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to(blogs_url) }
      format.xml  { head :ok }
    end
  end
end
