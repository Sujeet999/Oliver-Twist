class  RegistrationsController < Devise::RegistrationsController
  before_filter :authenticate_user!, :only => :token
  
  def new
    super
  end
  
   def create

      @user = User.find_by_email(params[:user][:email])
      if @user.nil? || @user.blank?
	#captcha_signup = params[:user][:captcha].upcase
 	resource = User.new(params[:user])
	#captcha = SimpleCaptchaData.find_by_key_and_value(params[:user][:captcha_key],captcha_signup)
   	 #if !captcha.nil? || !captcha.blank?
    	   if resource.save
     		 #JobMailer.confirmation_instruction(resource).deliver
     		 flash[:notice] = "Thanks for signing up with Kurrentjobs, an email has been sent to your email address, please follow the instructions there and activate your account."
    		   #redirect_to :controller => "devise/sessions", :action => :new

		render :text => "success"
    	   else
    		respond_to do |format|
	        format.html { render :action => "new" }
        	format.xml  { render :xml => resource.errors }


           end
         end
      #else
	
      #build_resource
    # resource.valid?
    #  clean_up_passwords(resource)
    #  resource.errors.add(:base, "There was an error with the recaptcha code below. Please re-enter the code.")
    #  render_with_scope :new
	#render :text => "Invalid captcha!"
    #end
   else
	render :text => "Email has already been taken!"
   end
	
	#end
  end
  
  def update
    super
  end
end 
