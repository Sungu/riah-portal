class ApplicantsController < ApplicationController
  before_action :set_applicant, only: :destroy

  def create
    @post = Post.find(params[:post])
    if @post.applicants.where(user_id: current_user.id).exists?
      flash[:notice] = "이미 지원 신청 되었습니다!"
      redirect_to :back
    else
      applicant = @post.applicants.new 
      applicant.user_id = current_user.id
      applicant.save
      redirect_to :back
    end
  end

  def destroy
    @applicant.destroy
  end

  private

  def set_applicant
    @applicant = @post.applicants.find(params[:id])
  end

  def applicant_params
    params.require(:applicant).permit(:user_id)
  end
end
