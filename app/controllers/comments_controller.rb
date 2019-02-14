class CommentsController < ApplicationController


  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    # @comment.save
    # redirect_to product_path(@product)

    respond_to do |format|

      if @comment.save

        # save was OK
        format.html{
          redirect_to @product, notice: "Your review has been added to #{@product.name}."
        }
        format.json{
          render :show, status: :created, location: @product
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
    redirect_to product

  end


  private

  def comment_params
    params.require(:comment).permit(:user_id, :body, :rating)
  end

end
