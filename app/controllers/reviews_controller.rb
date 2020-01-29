class ReviewsController < ApplicationController

  def index
    if
      author = params[:author]
      @reviews = Review.author_search(author)
        json_response(@reviews)
    elsif
      content = params[:content]
      @reviews = Review.content_search(content)
      json_response(@reviews)
    elsif
      created_at = params[:created_at]
      @reviews = Review.specific_time_search(created_at)
      json_response(@reviews)
    else
      @reviews = Review.all
       json_response(@reviews)
    end
  end

   def show
     @review = Review.find(params[:id])
     json_response(@review)
   end

   def create
     @review = Review.create(review_params)
     json_response(@review)
   end

   def update
     @review = Review.find(params[:id])
     @review.update(review_params)
   end

   def destroy
     @review = Review.find(params[:id])
     @review.destroy
   end

   private
   def json_response(object, status = :ok)
     render json: object, status: status
   end

   def review_params
     params.permit(:author, :content, :destination_id)
   end
 end
