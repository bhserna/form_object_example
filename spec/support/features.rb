module Features
  def select_date(date, options = {})
    field = options[:from]
    select date.strftime('%Y'),  :from => "#{field}_1i" #year
    select date.strftime('%B'),  :from => "#{field}_2i" #month
    select date.strftime('%-d'), :from => "#{field}_3i" #day 
  end

  def have_target_name(text)
    have_css "[data-role=target-name]", text: text
  end

  def have_description(text)
    have_css "[data-role=description]", text: text
  end

  def have_inflow(text)
    have_css "[data-role=inflow]", text: text
  end

  def have_outflow(text)
    have_css "[data-role=outflow]", text: text
  end

  def have_date(text)
    have_css "[data-role=date]", text: text
  end
end
