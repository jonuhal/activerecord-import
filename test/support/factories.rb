FactoryGirl.define do
  factory :book_title do
    sequence(:book) { |n| "Book #{n}" }
  end

  factory :chapter_title do
    sequence(:chapter) { |n| "Chapter #{n}" }
  end

  factory :group do
    sequence(:order) { |n| "Order #{n}" }
  end

  factory :invalid_topic, :class => "Topic" do
    sequence(:title){ |n| "Title #{n}"}
    author_name nil
  end

  factory :topic do
    sequence(:title){ |n| "Title #{n}"}
    sequence(:author_name){ |n| "Author #{n}"}
  end

  factory :topic_with_book, :parent => :topic do
    after_build do |topic| 
      2.times do 
        book = topic.books.build(:title => Factory.next(:book_title), :author_name => 'Stephen King') 
        3.times do
          book.chapters.build(:title => Factory.next(:chapter_title))
        end
      end
    end
  end

  factory :widget do
    sequence(:w_id){ |n| n}
  end
end
