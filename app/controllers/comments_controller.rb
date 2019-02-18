class CommentsController < ApplicationController


  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user

    respond_to do |format|

      if @comment.save

        # save was OK
        format.html{
          redirect_to @product, notice: "Your review has been added to #{@product.name}."
        }
        format.json{
          render :show, status: :created, location: @product
        }

        format.js{
          @comments = @product.comments.paginate(page: 1, per_page: 2).order("created_at DESC")
        }

      else

        # save was NOT ok
        format.html{
          redirect_to @product, alert: "Something went wrong with your review for #{@product.name}."
        }
        format.json{
          render json: @comment.errors, status: :unprocessable_entity
        }

      end

    end


  end


  def destroy

    @comment = Comment.find(params[:id])
    product = @comment.product
    @comment.destroy

    respond_to do |format|

      format.html do
        redirect_to product, notice: "Review deleted."
      end

      format.js do
        @comments = product.comments.paginate(page: params[:page], per_page: 2).order("created_at DESC")
      end

    end

  end


  private

  def comment_params
    params.require(:comment).permit(:user_id, :body, :rating)
  end

end
