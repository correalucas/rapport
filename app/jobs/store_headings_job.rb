require 'open-uri'

class StoreHeadingsJob < ApplicationJob
  queue_as :default

  def perform(member_id)
    member = Member.find(member_id)
    doc = Nokogiri::HTML(open(member.original_url))

    links = []
    links << member.original_url
    doc.css("a[@href^='#{member.original_url}']").map {|l| links << l.attribute('href').value }

    headings = []
    links.uniq.each do |link|
      page = Nokogiri::HTML(open(link))
      page.css("h1, h2, h3").map {|h| p headings << h.text }
    end

    member.update(headings: headings.uniq.join(' '))
  end
end
