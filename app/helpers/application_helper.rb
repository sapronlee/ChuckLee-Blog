module ApplicationHelper
  def auth_token
    result = <<-end 
      <div style=\"margin:0;padding:0;display:inline\">
        <input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" />
        <input name=\"authenticity_token\" type=\"hidden\" value=\"#{form_authenticity_token}\" />
      </div>
    end
    raw result
  end
end
