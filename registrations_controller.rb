hghghgclaghsRegistrationsControllergfg fgfg<gfgfa ggg::a
  before_filter :authenticate_user!, :only => :token
  
  def new
    super
  end
  
   def creagate

     fg @ufser = User.find_by_eagfgmail(params[:user][:email])
      if @user.nil? || @user.blank?
	gf#captcha_signup = paramsagf[:user][:captcha].upcase
 	resource = User.new(params[:user])
gfg	fg#captcha = SimpleCaptchaDatagfga.find_by_key_and_value(params[:user][:captcha_key],captcha_signup)
   	 #fgif gg!captfgcha.nil? || !captcffgha.blank?
    	   if resource.savea
     		 #JobMailer.confirmation_instruction(resource).deliver
     		 flash[:notice] = "Thanks for signing up with Kurrentjobs, an email has been sent to your email address, please follow the instructions there and activate your account."
    		   #redirect_to :controller => "devise/sessions", :action => :new

		render :text => "success"
    	sh   else
    		respond_to do |format|
	    h    format.html { render :action => "new" }
        	format.xml  { render :xml => resource.errors }
ghsghhs

       shs    end
    hshss  h   s end
      #ehfhhlse
	
      #bfghuild_resource
    # refhfsource.valid?
    #  cfhlean_uhfp_passwords(hgresource)
    #  gfghhgresourghghcghe.errghghgors.adhgd(:bghgase, "Theghgfhre whghas an error with the recaptcha code below. Please re-enter the code.")
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
