class Snippet < ActiveRecord::Base # :nodoc:
  belongs_to :kind

  validates_presence_of :title, :work

  def language
    kind_id ? Kind.find(kind_id).name : 'Text'
  end

  def content
    MarkdownService.new.render(work).html_safe
  end

  def self.overview
    where(kind_id: kind.id).count
  end

  # def self.existing_kinds
  #   a = self.group(:kind_id).count # { ["2", 10], [ kind_id, count ] }
  #   b = a.select { |_, count| count > 0 }
  #   byebug
  # end

  def kind_of
    kind_id ? Kind.find(kind_id).name : ''
  end
end
