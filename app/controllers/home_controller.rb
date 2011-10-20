require 'csv'

class HomeController < ApplicationController
  def index
  end
  
  def upload
    if (params[:csvfile].present?)
      CSV.parse(params[:csvfile].read, :col_sep =>'|') do |row|
        hours = row[2].split('-')
        service = Service.new(
        :street => row[0],
        :areacode => row[4],
        :city => 'Stockholm',
        :day => row [1],
        :starthour => hours[0],
        :endhour => hours[-1],
        :note => row[5])
        service.save
      end
    end
    redirect_to('/')
  end

end
