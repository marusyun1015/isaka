class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_books, through: :likes, source: :book

  has_many :wants, dependent: :destroy
  has_many :wanted_books, through: :wants, source: :book

  has_many :comments, dependent: :destroy

  # has_many :perfumes, dependent: :destroy
  # has_many :resulted_perfumes, through: :results, source: :book

  has_many :results, dependent: :destroy
  has_many :perfumes, dependent: :destroy


  def already_liked?(book)
    self.likes.exists?(book_id: book.id)
  end

  def already_wanted?(book)
    self.wants.exists?(book_id: book.id)
  end

  validates :name, presence: true #追記
  validates :profile, length: { maximum: 200 } #追記

end
