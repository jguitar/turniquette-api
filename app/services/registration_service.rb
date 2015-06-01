class RegistrationService
  def from_invitation(email, invitation_token, user_data = {})
    Invitation.find_by(email: email, token: invitation_token)
    User.create({ email: email }.merge(user_data))
  rescue Mongoid::Errors::DocumentNotFound
    # find & find_by raises exception if not found
  end
end
