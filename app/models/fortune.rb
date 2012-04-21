class Fortune < ActiveRecord::Base
  attr_accessible :quotation, :source

  validates :quotation, presence: true
  validates :quotation, length: { maximum: 256 }
  validates :quotation, uniqueness: { case_sensitive: false }

  validates :source, length: { in: 3..64 }, allow_blank: true

  def self.search(search)
    if search
      where('quotation LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

end
