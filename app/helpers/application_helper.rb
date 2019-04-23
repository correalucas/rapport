module ApplicationHelper

  def short_path_breadcrumb(from, to)
    text = []
    from = Member.find(from)
    to = Member.find(to)
    path = ShortPath.get_path(from, to)

    if path
      path.each do |member_id|
        member = Member.find(member_id)
        text << link_to(member.name, profile_path(member))
      end

      return text.join(' > ').html_safe
    end
  end
end
