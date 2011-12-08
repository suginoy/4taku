class User < ActiveRecord::Base
  has_many :scores
  has_many :questions, :through => :scores
 #has_many :summaries, :through => :scores # user_id をSummaryに追加して直接参照する
  has_many :summaries
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  def prepare_summary(question_id)
    if Summary.where(:user_id => self.id, :question_id => question_id).length == 0
      Summary.create!(:user_id => self.id, :question_id => question_id, :total => 0, :right => 0)
    else
      Summary.find_by_user_id_and_question_id(self.id, question_id)
    end
  end
end
