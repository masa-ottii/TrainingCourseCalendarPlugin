class Event
  include ActiveModel::Conversion
  include ActiveModel::Validations
  extend ActiveModel::Naming
  extend ActiveModel::Translation

  attr_accessor :title
  attr_accessor :description
  attr_accessor :place
  attr_accessor :assigned
  attr_accessor :url
  attr_accessor :start_date
  attr_accessor :end_date
  attr_accessor :color

  def as_json(options = {})
    {
      #:id => self.id,
      :title => self.title,
      :description => self.description,
      :place => self.place,
      :assigned => self.assigned,
      :start => self.start_date,
      :end => self.end_date,
      :allDay => true,
      :recurring => false,
      :url => self.url,
      :color => self.color
    }
  end
end
