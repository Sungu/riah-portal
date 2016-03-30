class ApplicantsController < ApplicationController
  before_action :set_post
  before_action :set_applicant, only: :destroy

  def create
    @applicant = @post.applicants.new(applicants_params)
    @applicant.save
  end

  def destroy
    @applicant.destroy
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_applicant
    @applicant = @post.applicants.find(params[:id])
  end

  def applicant_params
    params.require(:applicant).permit(:user_id)
  end
end
