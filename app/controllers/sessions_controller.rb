class SessionsController < Devise::SessionsController
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

	def create
		respond_to do |format|
			format.html{super}
			format.json{
				warden.authenticate!(scope: resource_name, recall: "#{controller_path}#new")
				render status: 200, json:{session:{error:"Success", auth_token: current_user.authentication_token}}
			}
		end
	end

	def destroy
		respond_to do |format|
			format.html{super}
			format.json{
				warden.authenticate!(scope: resource_name, recall: "#{controller_path}#new")	
				current_user.authentication_token = nil
				render json: {}.to_json, status: :ok
			}
		end
	end	
end
