class ApplicationController < ActionController::Base

  # サインイン後にどこに遷移するかを設定しているメソッド
  # (Deviseが用意しているメソッド) 7章
  before_action :configure_permitted_parameters, if: :devise_controller?

  # サインイン後にルートパスに遷移しないよう、初期設定を上書きする
  def after_sign_in_path_for(resource)
    about_path
  end

  # ログアウト後、aboutに転移
  def after_sign_out_path_for(resource)
    about_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
