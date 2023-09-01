module ErrorHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound,        with: :not_found
    rescue_from ActiveRecord::RecordInvalid,         with: :record_invalid
    rescue_from ActionController::ParameterMissing,  with: :parameter_missing
  end

  def not_found(exception)
    logger.info { exception }
    render json: { error: I18n.t('errors.not_found', record: resource_instance_name) }, status: :not_found
  end

  def record_invalid(exception)
    logger.info { exception }
    render json: { errors: exception.record.errors.as_json }, status: :unprocessable_entity
  end

  def parameter_missing(exception)
    logger.info { exception }
    render json: { error: I18n.t('errors.missing_param') }, status: :unprocessable_entity
  end
end
