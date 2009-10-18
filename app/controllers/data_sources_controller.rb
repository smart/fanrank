class DataSourcesController < ApplicationController
  
  def index
    @data_sources = DataSource.all
  end
  
  def new
    @data_source = DataSource.new
  end
  
  def create
    @data_source = params[:data_source_type].constantize.new(params[:data_source])
    if @data_source.save
      flash[:notice] = "Successfully created new data source"
       redirect_to data_sources_path
    else
      flash[:error] = "An error occured when created data source"
      redirect_to new_data_source_path
    end
  end
  
  def show 
    @data_source = DataSource.find(params[:id])
  end
  
  def edit
    @data_source = DataSource.find(params[:id])
  end
  
  def update
    @data_source = DataSource.find(params[:id])
    
    if @data_source.update_attributes(params[@data_source.class.to_s.underscore])
      flash[:notice] = "Successfully updated data source"
      redirect_to data_source_path(@data_source)
    else
      flash[:error] = "A error occured while updating this data source"
      redirect_to edit_data_source_path(@data_source)
    end
  end
  
  def destroy
    DataSource.delete(params[:id])
    redirect_to data_sources_path
  end
  
  
  
end
