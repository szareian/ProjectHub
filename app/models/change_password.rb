class ChangePasswordValidation < ActiveModel::Validator
    def validate(record)
        
        puts record.token
        #require 'digest'
        #md5 = Digest::MD5.new
        #password = md5.hexdigest record.password
        #user = User.where('email = (?) AND password =  (?)', record.email, password).take
        #if user == nil
        #record.errors[:base] << "Invalid Credentials"
        #end
    end
end

class ChangePassword < ActiveRecord::Base
    attr_accessor :token
    validates_with ChangePasswordValidation
end
