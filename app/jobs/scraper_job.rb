require 'rubygems'
require 'nokogiri'
require 'open-uri'

# PSEUDOCODE

# Class Post
# attributes: title, url, points, item_id, comments_list
# comments_list:
#  Extract the default class
#  Parse through default class to find the comments class
#  Push each found comment into the comments_list instance variable

# comments method => returns all comments of that post
# add_comment => takes a Comment object as input and adds it to comments list

class ScraperJob < ActiveJob::Base
  include Sidekiq::Worker

  queue_as :default

  def greeting(string)
    p "do the #{string}" * 100
  end

  def perform(args)
    greeting(args)
  end
end

class Lodging
  attr_reader # attributes of lodging

  def initialize
    @page = Nokogiri::HTML(open(ARGV[0]))
    @title = @page.css('title').text
    @url = url
    @item_id = (/(\d*)/).match(ARGV[0]).to_s
    @points = @page.css("#score_#{@item_id}").text # .text displays the text, not the tag
    @array_of_comment_objects = []
  end

  def format_info
    @array_of_info_hashes = []
    @page.search('.default').each do |whole_comment|
      single_comment = Hash.new(nil)
      single_comment[:user_name] = whole_comment.css('.comhead a')[0].text
      single_comment[:comment_text] = whole_comment.css('.comment p').text
      single_comment[:url] = whole_comment.css('.comhead a')[1]['href']
      @array_of_info_hashes << single_comment
    end
    @array_of_info_hashes
  end

  def populate_post
    @array_of_info_hashes.map { |comment| add_comment(comment) }
  end

  def comments
    @array_of_comment_objects
  end

  def add_comment(comment)
    @array_of_comment_objects << Comment.new(comment)
  end

end


# Class Comment
# attributes: user, comment text, url

class Comment
  attr_reader :user_name, :comment_text, :url

  def initialize(args = {})
    @url = args.fetch(:url, nil)
    @user_name = args.fetch(:user_name, nil)
    @comment_text = args.fetch(:comment_text, nil)
  end

end

# myPost = Post.new
# puts "should be empty array of objects"
# p myPost.array_of_comment_objects
# p myPost.format_info
# puts "should show info hashes"
# p myPost.array_of_info_hashes
# myPost.populate_post
# puts "should be a full array of objects"
# puts myPost.array_of_comment_objects
# puts "add comment with add_comment"
# p myPost.add_comment({user_name: "matt", url: "http:google.com", comment_text: "this is comment text"})
# puts "show contents of array of comments objects"
# p myPost.comments

# # comment = Comment.new('id=5003980.html')
# # p comment.user_name
# # p comment.comment_text
