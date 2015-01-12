class ShareOnFbsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    vehi_id = request.env['omniauth.params']['drive_id']
    @post = Vehicle.find(vehi_id)

    unless @auth = ShareFb.find_from_hash(auth)
      @auth = ShareFb.find_or_create(auth)
    end

    @auth.update_attributes({
        :secret => auth['credentials']['token']
      })

    @user = @auth
    session[:fb_token] = auth['credentials']['token'] if @auth['provider'] == 'facebook'
    if @user.persisted?
      @post.post(@post)
      ShareFb.destroy_all
      redirect_to '/'
    end
  end
end
