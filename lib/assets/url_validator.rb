class UrlValidator < ActiveModel::Validator
  URL = /^[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix

  def validate(record)
  	unless record.long_url =~ URL
  		error_message = "That is not a valid URL."
  		record.errors[:url] << error_message
  	end
  end
end