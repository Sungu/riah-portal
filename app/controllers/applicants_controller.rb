class ApplicantsController < ApplicationController
  before_action :set_applicant, only: :destroy

  def create
    @post = Post.find(params[:post])
    if @post.applicants.where(user_id: current_user.id).exists?
      a = @post.applicants.where(user_id: current_user.id)[0]
      a.destroy
      flash[:notice] = "지원 신청이 취소 되었습니다!"
      redirect_to :back
    else
      applicant = @post.applicants.new 
      applicant.user_id = current_user.id
      applicant.save
      flash[:notice] = "지원 신청 되었습니다!"
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
