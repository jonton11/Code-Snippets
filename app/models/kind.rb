class Kind < ActiveRecord::Base # :nodoc:
  has_many :snippets, dependent: :destroy

  def name_of(thing)
    find(thing)
  end
end
