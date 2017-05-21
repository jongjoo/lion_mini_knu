class Post < ActiveRecord::Base
    validates :writer, presence: { message: "누군지는 압시다.. alret창 뜨게 하겠습니다"}
end
