# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit]
  before_action :set_report_for_current_user, only: %i[update destroy]

  # GET /reports or /reports.json
  def index
    @reports = Report.joins(:user).select('reports.*, users.name as user_name, users.email as user_email').order(:id).page(params[:page])
  end

  # GET /reports/1 or /reports/1.json
  def show
    @comments = @report.comments.joins(:user).select('comments.*, users.name as user_name, users.email as user_email').order(:created_at, :desc).page(params[:page])
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
    redirect_to reports_path, alert: t('errors.messages.not_authorized') unless @report.user_id == current_user.id
  end

  # POST /reports or /reports.json
  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id

    if @report.save
      redirect_to report_url(@report), notice: t('controllers.common.notice_create', name: Report.model_name.human)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reports/1 or /reports/1.json
  def update
    if @report.update(report_params)
      redirect_to report_url(@report), notice: t('controllers.common.notice_update', name: Report.model_name.human)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /reports/1 or /reports/1.json
  def destroy
    @report.destroy

    redirect_to reports_url, notice: t('controllers.common.notice_destroy', name: Report.model_name.human)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = Report.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def report_params
    params.require(:report).permit(:title, :content)
  end

  def set_report_for_current_user
    @report = current_user.reports.find(params[:id])
  end
end
