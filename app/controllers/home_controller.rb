class HomeController < ApplicationController

  def index
    gon.eruptions = Eruption.points
  	gon.earthquakes = Earthquake.points
  end

  def set_markers
    lat_hi = params[:lat_hi]
    lat_lo = params[:lat_lo]
    long_hi = params[:long_hi]
    long_lo = params[:long_lo]
    gon.eruptions = Eruption.points(lat_hi,lat_lo,long_hi,long_lo)
    gon.earthquakes = Earthquake.points(lat_hi,lat_lo,long_hi,long_lo)

    render :nothing => true, :status => 200, :content_type => 'text/html'
  end

  def earthquake_data
    earthquake = Earthquake.fetch(params[:id])
    render :partial => 'earthquake_show', :locals => { :earthquake => earthquake }
  end

  def eruption_data
    eruption = Eruption.fetch(params[:id])
    render :partial => 'eruption_show', :locals => { :eruption => eruption }
  end

end
