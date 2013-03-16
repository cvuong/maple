class Post < ActiveRecord::Base
  attr_accessible :content, :title, :image, :company_id

  has_attached_file :image, :styles => { :medium => "250x250>", :thumb => "100x100>" }, :default_url => "posts/:style/missing.png"

  belongs_to :user
  belongs_to :company

  acts_as_voteable

  def public_model(options = {})
    self.to_json(:include => [:user, :company])
  end

  def self.public_models(posts, options = {})
    posts_json = posts.as_json({:include => {:user => { :only => [:uid, :email] }, :company => { :only => :name} }, :methods => [:image_url, :total_votes]})

    posts.each_with_index do |post, idx|
      posts_json[idx][:full_image_url] = post.image.url
      posts_json[idx][:image_url] = post.image.url(:medium)
      posts_json[idx][:total_votes] = post.votes_for
      posts_json[idx][:voted_on] = post.voted_on(options[:user]) if options[:user]
    end
    posts_json.to_json
  end

  def self.paged_posts(options = {})
    options[:page] ||= 1
    #TODO sort in SQL query so we can paginate
    posts = Post.all
    if options[:company]
      posts = posts.select do |post|
        options[:company].include? post.company.name
      end
    end

    posts.sort { |p1, p2| p2.votes_for <=> p1.votes_for }
  end

  def voted_on(user)
    if (user)
      if (self.voted_by?(user))
        1
      else
        0
      end
    else
      2
    end
  end

end
