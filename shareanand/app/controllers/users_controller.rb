class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy,:finish_signup]
  before_filter :set_user, only: [:show, :edit, :update]
  before_filter :validate_authorization_for_user, only: [:edit, :update]
  before_filter :authenticate_user!

  # GET /users/:id.:format
  def show
     #authorize! :read, 
     @user=User.find(params[:id])
  end

#def index
     #authorize! :read, 
 #    @user=User.all
 # end
  # GET /users/:id/edit
  def edit
     authorize! :update
     @user=User.find(params[:id])
  end

  # PATCH/PUT /users/:id.:format
  def update
    # authorize! :update, @user
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(user_params)
        sign_in(@user == current_user ? @user : current_user, :bypass => true)
        format.html { redirect_to @user, notice: 'Your profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET/PATCH /users/:id/finish_signup
  def finish_signup
    # authorize! :update, @user 
    @user = User.find(params[:id])
    if request.patch? && params[:user] #&& params[:user][:email]
      if @user.update_attributes(user_params)
        @user.skip_reconfirmation!  #comment to force the user to confirm their email address
        sign_in(@user, :bypass => true)
        redirect_to user_path, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

  # DELETE /users/:id.:format
  def destroy
    # authorize! :delete, @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
  
  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      accessible = [ :id, :name, :email ] # extend with your own params
      accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
      params.require(:user).permit(accessible)
    end
end
