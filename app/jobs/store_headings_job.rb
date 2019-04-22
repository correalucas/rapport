require 'open-uri'

class StoreHeadingsJob < ApplicationJob
  queue_as :default

  def perform(member_id)
    member = Member.find(member_id)
    doc = Nokogiri::HTML(open(member.original_url), nil, 'UTF-8')

    links = []
    links << member.original_url
    doc.css("a[@href^='#{member.original_url}']").map {|l| links << l.attribute('href').value }

    headings = []
    links.uniq.each do |link|
      page = Nokogiri::HTML(open(link), nil, 'UTF-8')
      page.css("h1, h2, h3").map {|h| headings << h.text.encode('UTF-8', invalid: :replace, undef: :replace) }
    end

    member.update(headings: headings.uniq.join(' '))
  end
end
