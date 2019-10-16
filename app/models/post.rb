class Post < ApplicationRecord
    belongs_to :user
    has_attached_file :image, styles: {  medium: "1200x720>", thumb: "50x50>" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    validates :category, presence: true
    validates :title, :presence => true
    validates :body, :presence => true
    belongs_to :category
    has_many :taggings
    has_many :tags, through: :taggings

    def self.search(search)
        # Title is for the above case, the OP incorrectly had 'name'
        where("title LIKE ?", "%#{search}%")
      end
      def self.tagged_with(name)
        Tag.find_by!(name: name).post
      end
    
      def self.tag_counts
        Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
      end
    
      def tag_list
        tags.map(&:name).join(', ')
      end
    
       def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
