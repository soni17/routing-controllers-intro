class PagesController < ApplicationController

  before_action :set_kitten_url, only: [:kitten, :kittens]

  def welcome
    @header = "This is the welcome page"
  end

  def about
    @header = "This is the about page"
  end

  def contest
    flash[:notice] = "Sorry, the contest has ended"
    redirect_to "/welcome"
  end

  def kitten

  end

  def kittens

  end

  def set_kitten_url
    requested_size = params[:size]
    @kitten_url = "http://lorempixel.com/#{requested_size}/#{requested_size}/cats"
  end

  def secrets
    magic_word = params[:magic_word]

    if magic_word == "keyword"
      flash[:notice] = "You made it to the secret page. Congratulations"
    else
      flash[:notice] = "you're not authorized to access the secret page...boo hoo"
      redirect_to "/welcome"
    end
  end

end
