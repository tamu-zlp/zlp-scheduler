class TermOpenRange < ActiveRecord::Base
  def starts_at_date=(date)
    @starts_at_date = date
  end

  def starts_at_time=(time)
    @starts_at_time = time
  end

  def starts_at_date
    starts_at&.strftime('%m/%d/%Y')
  end

  def starts_at_time
    starts_at&.strftime('%H:%M')
  end
end