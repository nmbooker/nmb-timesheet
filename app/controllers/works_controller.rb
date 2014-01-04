require 'csv'

class WorksController < ApplicationController
  before_filter :authenticate_user!

  # GET /works
  # GET /works.json
  def index
    @works = Work.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @works }
      format.csv {
        data = self.csvdata(@works)
        data_to_send = CSV.generate do |csv|
          data.each do |row|
            csv << row
          end
        end
        send_data data_to_send
      }
    end
  end

  # GET /works/1
  # GET /works/1.json
  def show
    @work = Work.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @work }
    end
  end

  # GET /works/new
  # GET /works/new.json
  def new
    @work = Work.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @work }
    end
  end

  # GET /works/1/edit
  def edit
    @work = Work.find(params[:id])
  end

  # POST /works
  # POST /works.json
  def create
    @work = Work.new(params[:work])

    respond_to do |format|
      if @work.save
        format.html { redirect_to action: 'index', flash: {notice: 'Work item was successfully created.' }}
        format.json { render json: @work, status: :created, location: @work }
      else
        format.html { render action: "new" }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /works/1
  # PUT /works/1.json
  def update
    @work = Work.find(params[:id])

    respond_to do |format|
      if @work.update_attributes(params[:work])
        format.html { redirect_to action: 'index', flash: {notice: 'Work item was successfully updated.' }}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /works/1
  # DELETE /works/1.json
  def destroy
    @work = Work.find(params[:id])
    @work.destroy

    respond_to do |format|
      format.html { redirect_to works_url }
      format.json { head :no_content }
    end
  end

  protected
    def csvdata(works)
      lines = []
      header = ['id', 'date', 'project.code', 'project.name', 'activity.code', 'activity.name', 'minutes', 'description']
      lines << header
      for w in works
        lines << [
          w.id,
          w.date,
          w.project.code,
          w.project.name,
          w.activity.code,
          w.activity.name,
          w.minutes,
          w.description,
        ]
      end
      return lines
    end
end
