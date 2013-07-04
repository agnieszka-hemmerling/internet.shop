class Order < ActiveRecord::Base
  has_and_belongs_to_many :products
	
	attr_accessible :name, :surname, :adress, :post, :email, :information, :phone1, :pysio1, :pysio2, :pysio3  

	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 
  validates :name,		   :presence   => true,
                         :length     => { :within => 2..10 },
                         #:length     => { :maximum => 100 },
                         :format     => { :with => /\A[a-zA-Z]+\z/ } 

  validates :surname,	   :presence   => true,
                         :length     => { :maximum => 100 },
                         :format => { :with => /\A[a-zA-Z]+\z/ }

  validates :adress,     :presence   => true,
                         :length     => { :maximum => 300 }

  validates :post,  :presence  => true ,
                        :format => { :with => /\d+./ }

  validates :email,      :presence   => true, 
                         :format     => { :with => email_regex }

  validates :information,:allow_blank => true,
                         :length     => { :maximum => 200 } 
                        

  validates :phone1,    :allow_blank => true,
                        :format => { :with => /\d+./ }
 
end 

