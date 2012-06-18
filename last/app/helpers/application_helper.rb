module ApplicationHelper

  def welcome_text
    str = "" #jika user telah login, tampilkan welcome textnya
    if current_user
      str = "Welcome, #{current_user.email}  "
      #str += link_to "Logout", log_out_path
    else
      #str = "#{link_to "Login", home_index_path} | "
      #str += link_to "Signup", sign_up_path
    end
  end

  def list_categories
    str = "<ul>"
    Category.where(["parent_id IS NULL"]).each do |parent_category|
      str += "<li>#{parent_category.name}</li>"
      str += "<ul>"
      Category.where("parent_id = ?", parent_category.id).each do |category|
        str += "<li>#{category.name}</li>"
      end
      str += "</ul>"
    end
    return str += "</ul>"
  end

end
