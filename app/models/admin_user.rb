class AdminUser < ApplicationRecord
    has_and_belongs_to_many :page
    has_many :section_edits
    has_many :sections, through: :section_edits

    validates :first_name,  presence: true
                            length: maximun: 25
    validates :last_name,   presence: true
                            length: maximun: 50
    validates :username,    length: { withing: 8..25 }
                            :uniqueness: true
    validates :email,       presence: true
                            length: { withing: 8..25 }
                            format: EMAIL_REGEX
                            confirmation: true
end
