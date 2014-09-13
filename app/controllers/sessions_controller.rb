class SessionsController < Devise::SessionsController

  def create
    super do |resource|
      resource.ensure_authentication_token if request.format.json?
    end
  end

end
