module Features
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
end
