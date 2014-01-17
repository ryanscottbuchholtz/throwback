class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_save :mailchimp_status
  
  validates_presence_of :first_name, :last_name, :role, :birth_month, :birth_year, :birth_day

  has_many :memories,
    inverse_of: :user,
    dependent: :destroy

  has_many :questions,
    through: :memories

  has_many :dna_questions,
    inverse_of: :user

  def is_admin?
    role == 'admin'
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def mailchimp_status
    @mailchimp_list_id = ENV["mail_chimp_list_id"]
    @gb = Gibbon::API.new
      @gb.lists.subscribe({
      :id => @mailchimp_list_id,
      :email => {:email => self.email},
      :merge_vars => {
        :FNAME => self.first_name,
        :LNAME => self.last_name,
        :BIRTHDAY => self.birth_year
      },
      :double_optin => false,
      :send_welcome => false
    })
  end

  
end
