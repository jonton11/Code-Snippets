class Snippet < ActiveRecord::Base # :nodoc:
  belongs_to :kind

  validates_presence_of :title, :work
  validates :work, length: { minimum: 5 }

  def language
    kind_id ? Kind.find(kind_id).name : 'Plain Text'
  end

  def content
    MarkdownService.new.render(work).html_safe
  end

  def wrap_in_pre_tags
    "```#{language}\n" + work + "\n```"
  end

  def kind_of
    kind_id ? Kind.find(kind_id).name : ''
  end

  def is_markdown?
    language == "Markdown"
  end
end
