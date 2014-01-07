class Message

   include ActiveModel::Validations
   include ActiveModel::Conversion
   include ActiveModel::Naming

  attr_accessor :first_name, :last_name, :email, :subject, :body

  validates_presence_of :first_name, :last_name, :email, :subject, :body
  validates :email, format: {with: /.+@.+\..+/i}

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

def persisted?
  false
end

end

