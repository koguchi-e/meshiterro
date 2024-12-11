class Public::ApplicationController < ActionController::Base

  # サインイン後にどこに遷移するかを設定しているメソッド
  # (Deviseが用意しているメソッド) 7章
  before_action :authenticate_user!, except: [:top], unless: :admin_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 権限の設定

  private

  def configure_authentication
    # 現在のコントローラーがAdmin名前空間の下にあるかどうかを判定する。
    if admin_controller?
      # 管理者用の処理
      authenticate_admin!
    else
      # ユーザ用の処理
      authenticate_user! unless action_is_pubric?
    end
  end
 
  # 管理者用とユーザー用の認証処理を簡単に切り替えることができる
  def admin_controller?
    self.class.module_parent_name == 'Admin'
  end

  # 特定のアクション（この例ではhomes#top）が認証が不要かどうかを判定します。
  def action_is_pubric?
    controller_name == "homes" && action_name == "top"
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
