class Admin::ArticlesController < Admin::ApplicationController
    before_filter :require_admin_login
end
